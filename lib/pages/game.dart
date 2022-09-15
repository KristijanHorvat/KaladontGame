import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:first_app/generator.dart';
import 'package:first_app/txtLoader.dart';
import 'package:first_app/loseChecker.dart';
import 'package:first_app/GameAccessories.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final myController = TextEditingController();
  bool _isShow = false;
  @override
  String word = generatorRandom();
  int points = 0;

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void changeVariableOnUI(String string) {
    setState(() => word = string);
  }

  void incrementPoint(){
    points++;
    setState(() => points=points);
    debugPrint(points.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Gaming'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                points.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  word,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Unesi riječ!',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextButton.icon(
                onPressed: (){
                  var userWord = myController.text;
                  if(check(word, userWord)) {
                    word = getAnother(userWord);
                    myController.text='';

                    incrementPoint();
                  }
                  if(Contains(UserTypedWords, userWord)){
                    _isShow=true;
                    changeVariableOnUI("Ponovio si riječ!\nIzgubio si!");
                  }
                  if(CheckIfLost(word)==true){
                      _isShow=true;
                      changeVariableOnUI(" "+word+"\nIzgubio si!");
                    }
                  if(word=="Pobjedio si!"){
                    _isShow=true;
                    changeVariableOnUI(word);
                    debugPrint(word);
                  } if(Contains(EndGameWords, word)==false){
                    usedWords.add(word);
                    debugPrint(word);
                  }
                  UserTypedWords.add(userWord);
                },
                icon: Icon(Icons.heat_pump),
                label: Text('Submit'),
              ),
            ),
            Visibility(
              visible: _isShow,
              child: Container(
                child: ElevatedButton.icon(
                  onPressed: (){
                    points=0;
                    setState(() {
                      _isShow=!_isShow;
                    },
                    );
                    word = generatorRandom();
                    changeVariableOnUI(word);
                    myController.text='';
                    usedWords.add(word);
                  },
                  icon: Icon(Icons.reset_tv_rounded),
                  label: Text('Igraj ponovo!'),
                ),
              )
            ),
          ],
      ),
    );
  }
}
