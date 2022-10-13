import 'dart:math';
import 'package:first_app/GameAccessories.dart';

String generatorRandom() {
  var numberOfWords = arrayOfWords.length;
  var randomGenerator = Random();
  var randomNumber = randomGenerator.nextInt(numberOfWords);
  return arrayOfWords[randomNumber];
}
