import 'package:flutter/material.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/game.dart';
import 'package:first_app/pages/ranking.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:first_app/pages/settingsPage.dart';
import 'package:first_app/wordsAlgorithms.dart';
import 'package:first_app/words376988.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ucitaj(loadWordsForChekingNew());
  main_2();
}

void main_2() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const Home(),
    '/game': (context) => const Game(),
    '/ranking': (context) => const Ranking(),
    '/settings': (context) => const SettingsPageMy(),
  },
)
);