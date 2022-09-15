import 'package:flutter/material.dart';
import 'package:first_app/main.dart';
import 'package:first_app/FeedbackDialogPart.dart';

class SettingsPageMy extends StatefulWidget {
  const SettingsPageMy({Key? key}) : super(key: key);

  @override
  State<SettingsPageMy> createState() => _SettingsPageMyState();
}

class _SettingsPageMyState extends State<SettingsPageMy> {
  @override
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
        child: ElevatedButton(
          child: const Text('Feedback'),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const FeedbackDialog());
          },
        ),
      ),
    );
  }
}
