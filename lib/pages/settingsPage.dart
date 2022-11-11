import 'dart:ffi';

import 'package:first_app/GameAccessories.dart';
import 'package:flutter/material.dart';
import 'package:first_app/FeedbackDialogPart.dart';
import 'package:first_app/levelChoose.dart';

class SettingsPageMy extends StatefulWidget {
  const SettingsPageMy({Key? key}) : super(key: key);

  @override
  State<SettingsPageMy> createState() => _SettingsPageMyState();
}

class _SettingsPageMyState extends State<SettingsPageMy> {
  @override
  void dispose() {
    ChangeWordsByLevel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Settings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(child: const Text('Feedback'),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const FeedbackDialog());
          },
        ),
          Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Level ",
                style: TextStyle(fontSize: 30),)),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: const LevelChoose())
          ]),
      ])),
    );
  }
}
