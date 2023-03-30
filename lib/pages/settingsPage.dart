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
        backgroundColor: Colors.deepPurple[600],
        title: const Text('Postavke'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          ElevatedButton(child: const Text('Predloži riječ!'),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shadowColor: Colors.deepPurple,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(100, 40), //////// HERE
            ),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const FeedbackDialog());
          },
        ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Razina težine: ",
                style: TextStyle(fontSize: 25),)),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: LevelChoose())
          ]
          ),
      ]
        )
      ),
    );
  }
}
