import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:20),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.deepOrangeAccent,
                    height: 100,
                  child: TextButton.icon(
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
                )),),
              SizedBox(height:20),

            ]
            ),
            Row(children: <Widget>[
            Expanded(child: Container(
              color: Colors.lightGreen,
              height: 100,
              child: TextButton.icon(
              onPressed: (){
              Navigator.pushNamed(context, '/ranking');
              },
              icon: Icon(Icons.traffic, size: 50),
                label: Text('Ljestvica',
                  style: TextStyle(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 2
                      ..color = Colors.blue[700]!,
                  ),
                ),
              ),
              ),),
            SizedBox(height:20),]),
              Row(children: <Widget>[
            Expanded(child: Container(
              color: Colors.amber,
              height: 100,
              child: TextButton.icon(
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
            ),),
            SizedBox(height:20),
          ],
        ),
          ])
      ),
      );
  }
}
