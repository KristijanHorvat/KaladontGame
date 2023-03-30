import 'package:flutter/material.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/game.dart';
import 'package:first_app/pages/ranking.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/pages/settingsPage.dart';
import 'package:first_app/wordsAlgorithms.dart';
import 'package:first_app/words376988.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB28pY3UyCflJMxbE9HvCJtCvVgQ6n8yfY",
        appId: "1:493525377849:android:6221c76695d0c72987bee8",
        messagingSenderId: "493525377849",
        projectId: "feedback-form-5a2b2",
  ));
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