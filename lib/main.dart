import 'package:flutter/material.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/game.dart';
import 'package:first_app/pages/ranking.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/pages/settingsPage.dart';
import 'package:first_app/FeedbackDialogPart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  main_2();
}

void main_2() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/game': (context) => Game(),
    '/ranking': (context) => Ranking(),
    '/settings': (context) => SettingsPageMy(),
  },
)
);