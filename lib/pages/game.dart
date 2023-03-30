import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:first_app/generator.dart';
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
  }

  void decrementPoint(){
    points--;
    setState(() => points=points);
  }

  void processWord(){
    var userWord = myController.text.toLowerCase();
    if(check(word, userWord)) { // usporedba slova
      word = getAnother(userWord);
      myController.text='';
      incrementPoint();
    }
    if(Contains(UserTypedWords, userWord)){ //provjera jel vec upiso prije tu rijec
      _isShow=true;
      changeVariableOnUI("Ponovio si riječ!\nIzgubio si!");
      shuffle(shuffledWords);
      decrementPoint();
    }
    if(CheckIfLost(word)==true){ //provejera jel dobivena rijec jedna od endgame rijeci
      _isShow=true;
      changeVariableOnUI(" "+word+"\nIzgubio si!");
      shuffle(shuffledWords);
      decrementPoint();
    }
    if(word=="Pobjedio si!" || word=="Riječ ne postoji!"){
      _isShow=true;
      changeVariableOnUI(word);
      debugPrint(word);

      if(word=="Riječ ne postoji!") decrementPoint();
    }
    if(Contains(EndGameWords, word)==false){ //stavlja rijeci u listu vec iskoristenih rijeci
      usedWords.add(word);
      debugPrint(word);

    }
    UserTypedWords.add(userWord); //doda rijec u igracovu listu iskoristenih rijeci
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
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
                onEditingComplete: processWord,
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
                  processWord();
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
