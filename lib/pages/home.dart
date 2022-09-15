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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.lightGreen,
              child: TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/game');
                },
                icon: Icon(Icons.play_arrow),
                label: Text('Play'),
              )
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.redAccent,
              child: TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/ranking');
                },
                icon: Icon(Icons.traffic),
                label: Text('Ranking'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.grey,
              child: TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/settings');
                },
                icon: Icon(Icons.settings_accessibility_sharp),
                label: Text('Settings'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
