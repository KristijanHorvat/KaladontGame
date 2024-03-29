import 'dart:math';
//import 'package:first_app/txtLoaderMore50KWords.dart';
import 'package:first_app/allWords200K.dart';
import 'package:first_app/levelChoose.dart';
//import 'package:first_app/txtLoaderEasy.dart';
import 'package:first_app/wordsAlgorithms.dart';

//List<String> arrayOfWords = ['argument', 'kaladont', 'auto', 'brod', 'komp', 'cement', 'bolesnik', 'kuhar', 'laptop', 'škola', 'miš', 'okej'];
//List<String> arrayOfWords = ['ljekarna', "meljo", "maslac", 'pedžo', 'našice', 'ljopata', 'džopa', 'njopa', 'pas'];

//List<String> arrayOfWords = loadWordsForCheking();

List<String> gameWords=getElements(loadWordsImenice(), 50);

List<String> getElements(List userInput, nIndex){
  List<String> elements = [];
  for(int x = 0; x<userInput.length;x++){
    if(x % nIndex == 0){
      elements.add(userInput[x]);
    }
  }
  return elements;
}

void ChangeWordsByLevel(){
  gameWords=[];
  if(getLevel()=="easy"){
    //gameWords=loadWordsEasy();
    gameWords=getElements(loadWordsImenice(), 100);
    //debugPrint(gameWords[0]);
  }
  if(getLevel()=="medium"){
    //gameWords=loadWords50K();
    gameWords=getElements(loadWordsImenice(), 50);
    //debugPrint(gameWords[0]);
  }
  if(getLevel()=="hard"){
    //gameWords=loadWordsImenice();
    gameWords=getElements(loadWordsImenice(), 1);
    //debugPrint(gameWords[0]);
  }
  shuffledWords = shuffle(gameWords);
}

List<String> usedWords = [];
List<String> UserTypedWords = [];
List<dynamic> shuffledWords = shuffle(gameWords);
List<String> EndGameWords1 = [
  "cement",
  "kaladont",
  'argument',
  'eksperiment',
  'element',
  'remont',
  'imigrant'
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
  var random = Random();
  for (var i = items.length - 1; i > 0; i--) {
    var n = random.nextInt(i + 1);
    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }
  return items;
}

String getAnother(String wordPlayer){ //get new word to continue playing... kad zavrsava npr na elj treba popravit

  for(var newWord in shuffledWords){
    if(EndGameWords.contains(wordPlayer)==false){
      if(TestirajRijec(wordPlayer + "\n") == 0) { //provjerava jel uopce posotji takva rijec u rijecniku old: arrayOfWords.contains(wordPlayer)==true new: TestirajRijec(wordPlayer + "\n") == 0
        if(wordPlayer.substring(wordPlayer.length-3, wordPlayer.length-1)=="lj" || wordPlayer.substring(wordPlayer.length-3, wordPlayer.length-1)=="nj" || wordPlayer.substring(wordPlayer.length-3, wordPlayer.length-1)=="dž" || wordPlayer.substring(wordPlayer.length-2)=="lj" || wordPlayer.substring(wordPlayer.length-2)=="nj" || wordPlayer.substring(wordPlayer.length-2)=="dž"){
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
        UserTypedWords=[];
        return "Riječ ne postoji!";
      }
    }
  }
  UserTypedWords=[];
  return 'Pobjedio si!';
}

bool check(String wordComputer, String wordPlayer){ //check what user entered
  if(wordComputer.substring(wordComputer.length-3, wordComputer.length-1)=="lj" || wordComputer.substring(wordComputer.length-3, wordComputer.length-1)=="nj" || wordComputer.substring(wordComputer.length-3, wordComputer.length-1)=="dž" || wordComputer.substring(wordComputer.length-2)=="lj" || wordComputer.substring(wordComputer.length-2)=="nj" || wordComputer.substring(wordComputer.length-2)=="dž"){
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

