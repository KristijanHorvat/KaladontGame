import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

List<String> _questions = [];

Future<List<String>> loadWords() async {
  List<String> questions = [];
  await rootBundle.loadString('assets/filtrirano_rijeci.txt').then((q) {
    for (String i in LineSplitter().convert(q)) {
      questions.add(i);
    }
  });
  return questions;
}