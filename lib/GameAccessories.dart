import 'dart:math';
import 'package:flutter/material.dart';

List<String> arrayOfWords = ['argument', 'kaladont', 'auto', 'brod', 'komp', 'cement', 'bolesnik', 'kuhar', 'laptop', 'škola', 'miš', 'okej', 'mobitel', 'monitor', 'printer', 'pisač', 'autoškola', 'papir', 'slon', 'bojomet', 'uno', 'menu', 'kalkulator', 'pernica', 'čaj', 'kabal', 'kutija', 'jakna', 'škola', 'dom', 'podloga', 'okvir', 'besplatno', 'sloboda', 'slobodno', 'zamrznuti', 'česte', 'često', 'svježe', 'petak', 'prijatelju', 'prijateljski', 'prijateljstvo', 'uplašiti', 'uplašen', 'zastrašujuć', 'ispred', 'smrznuti', 'voće', 'pržiti', 'gorivo', 'puna', 'potpuno', 'zabava', 'funkcija', 'fond', 'temeljna', 'pogreb', 'smiješno', 'krzno', 'namještaj', 'unaprijediti', 'najdalje', 'budućnost', 'dobiti', 'galon', 'kockanje', 'igra', 'jaz', 'garaža', 'smeće', 'vrt', 'plin', 'benzin', 'kapija', 'skupiti', 'gay', 'zupčanik', 'gen', 'općenito', 'generirati', 'generacija', 'velikodušan', 'nježan', 'gospodin', 'nježno', 'pravi', 'geografija', 'slagati', 'sići', 'divovski', 'dar', 'djevojka', 'dati', 'radostan', 'staklo', 'globalno', 'rukavica', 'ljepilo', 'ići', 'cilj', 'bog', 'zlato', 'dobro', 'doviđenja', 'roba', 'vladati', 'vlada', 'guverner', 'zgrabiti', 'razred', 'postupno', 'postepeno', 'diplomirati', 'žitarica', 'gram', 'gramatika', 'veličanstven', 'unuče', 'unuka', 'djed', 'baka', 'napustiti', 'napuštena', 'sposobnost', 'sposoban', 'oko', 'iznad', 'inozemstvo', 'odsutnost', 'odsutan', 'apsolutna', 'apsolutno', 'upiti', 'zlostavljanje', 'akademski', 'naglasak', 'prihvatiti', 'prihvatljiv', 'pristup', 'nesreća', 'slučajno', 'pratiti', 'prema', 'račun', 'točne', 'optužiti', 'postići', 'postignuće', 'kiselina', 'priznati', 'steći', 'preko', 'djelovati', 'akcijski', 'aktivan', 'aktivista', 'aktivnost', 'glumac', 'glumica', 'stvarni', 'zapravo', 'oglas', 'prilagoditi', 'dodati', 'dodatak', 'dodatni', 'adresa', 'zbrojiti', 'adekvatan', 'administracija', 'divljenje', 'diviti', 'posvojiti', 'odrasla osoba', 'unaprijed', 'napredna', 'prednost', 'avantura', 'oglašavati', 'oglašavanje', 'savjet', 'savjetovati', 'afera', 'utjecati', 'ljubav', 'priuštiti', 'bojati', 'nakon', 'poslijepodne', 'poslije', 'opet', 'protiv', 'dob', 'dobi', 'agencija', 'dnevni red', 'agent', 'agresivan', ];
//Future<List<String>> arrayOfWords = loadWords();
List<String> usedWords = [];
List<String> UserTypedWords = [];
List<dynamic> shuffledWords = shuffle(arrayOfWords);
List<String> EndGameWords1 = ["cement", "kaladont", 'argument', 'eksperiment', 'element'];
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

String getAnother(String wordPlayer){
  for(var newWord in shuffledWords){
    if(newWord.substring(0,2) == wordPlayer.substring(wordPlayer.length-2) && usedWords.contains(newWord)==false){
      return newWord;
    }
  }
  return 'Pobjedio si!';
}

bool check(String wordComputer, String wordPlayer){
  if(wordComputer.substring(wordComputer.length-2) == wordPlayer.substring(0,2) && wordPlayer.length>2)   {
    return true;
  }
  return false;
}

