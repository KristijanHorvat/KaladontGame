import 'package:first_app/GameAccessories.dart';
import 'package:flutter/material.dart';

bool CheckIfLost(String word) {
  if(Contains(EndGameWords, word)){
    return true;
  }
  return false;
}