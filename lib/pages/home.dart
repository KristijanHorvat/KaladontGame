import 'package:flutter/material.dart';
import '';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[600],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo2.png'),
            SizedBox(height:20),
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                padding: EdgeInsets.all(16.0),
                    child: Container(
                    height: 100,
                  child: TextButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150.0),
                            ))),
                  onPressed: (){
                    Navigator.pushNamed(context, '/game');
                  },
                  icon: Icon(Icons.play_arrow,size: 50),
                  label: Text('Igraj',
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..strokeWidth = 2
                        ..color = Colors.blue[700]!,
                    ),
                  ),
                ))),),
              SizedBox(height:20),

            ]
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
              height: 100,
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
              onPressed: (){
              Navigator.pushNamed(context, '/ranking');
              },
              icon: Icon(Icons.traffic, size: 50),
                label: Text('Kako igrati?',
                  style: TextStyle(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 2
                      ..color = Colors.blue[700]!,
                  ),
                ),
              ),
              ),)),
            SizedBox(height:20),]),
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
              height: 100,
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
              onPressed: (){
              Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(Icons.settings_accessibility_sharp, size: 50),
                label: Text('Postavke',
                  style: TextStyle(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 2
                      ..color = Colors.blue[700]!,
                  ),
                ),
            ),
            ),)),
            SizedBox(height:20),
          ],
        ),
          ])
      ),
      );
  }
}
