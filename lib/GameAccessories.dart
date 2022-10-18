import 'dart:math';
//import 'package:first_app/txtLoader.dart';
//import 'package:first_app/txtLoaderMore50KWords.dart';
import 'package:first_app/allWords200K.dart';

//List<String> arrayOfWords = ['argument', 'kaladont', 'auto', 'brod', 'komp', 'cement', 'bolesnik', 'kuhar', 'laptop', 'škola', 'miš', 'okej'];
//List<String> arrayOfWords = ['ljekarna', "meljo", "maslac", 'kenjo', 'pedžo', 'sero', 'rogonja', 'našice', 'ljopata', 'džopa', 'njopa', 'pas'];

List<String> arrayOfWords = loadWords();
List<String> usedWords = [];
List<String> UserTypedWords = [];
List<dynamic> shuffledWords = shuffle(arrayOfWords);
List<String> EndGameWords1 = [
  "cement",
  "kaladont",
  'argument',
  'eksperiment',
  'element'
];
List<dynamic> EndGameWords = shuffle(EndGameWords1);

bool Contains(List<dynamic> list, String word){
  for(var item in list){
    if(item == word){
      return true;
    }
  }
  return false;
}

List shuffle(List items) {
  var random = new Random();
  for (var i = items.length - 1; i > 0; i--) {
    var n = random.nextInt(i + 1);
    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }
  return items;
}

String getAnother(String wordPlayer){ //get new word to continue playing
  for(var newWord in shuffledWords){
    if(EndGameWords.contains(wordPlayer)==false){
      if(arrayOfWords.contains(wordPlayer)==true) {
        if(wordPlayer.substring(wordPlayer.length-3, wordPlayer.length-1)=="lj" || wordPlayer.substring(wordPlayer.length-3, wordPlayer.length-1)=="nj" || wordPlayer.substring(wordPlayer.length-3, wordPlayer.length-1)=="dž"){
          if(newWord.substring(0,3) == wordPlayer.substring(wordPlayer.length-3) && usedWords.contains(newWord)==false){
            return newWord;
          }
        }else {
          if(newWord.substring(0,2) == wordPlayer.substring(wordPlayer.length-2) && usedWords.contains(newWord)==false) {
            return newWord;
          }
        }
        }
      else{
        return "Riječ ne postoji!";
      }
    }
  }
  return 'Pobjedio si!';
}

bool check(String wordComputer, String wordPlayer){ //check what user entered
  if(wordComputer.substring(wordComputer.length-3, wordComputer.length-1)=="lj" || wordComputer.substring(wordComputer.length-3, wordComputer.length-1)=="nj" || wordComputer.substring(wordComputer.length-3, wordComputer.length-1)=="dž"){
    if(wordComputer.substring(wordComputer.length-3) == wordPlayer.substring(0,3) && wordPlayer.length>2)   {
      return true;
      }
    }else{
      if(wordComputer.substring(wordComputer.length-2) == wordPlayer.substring(0,2) && wordPlayer.length>2)   {
        return true;
      }
    }
  return false;
}

