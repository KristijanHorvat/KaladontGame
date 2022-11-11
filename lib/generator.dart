import 'dart:math';
import 'package:first_app/GameAccessories.dart';
import 'package:flutter/cupertino.dart';

String generatorRandom() {
  var numberOfWords = gameWords.length;
  debugPrint(usedWords.toString());
  var randomGenerator = Random();
  var randomNumber = 0;
  do {
    randomNumber = randomGenerator.nextInt(numberOfWords);
  }while(EndGameWords1.contains(gameWords[randomNumber]) || usedWords.contains(gameWords[randomNumber]) || EndGameWords1.contains(gameWords[randomNumber]));
  return gameWords[randomNumber];
}
