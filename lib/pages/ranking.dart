import 'package:flutter/material.dart';
import 'dart:ui';
class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        title: Text('Kako igrati?'),
        centerTitle: true,
        elevation: 0,
      ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height:10,
                  width: 200,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple
                    ),
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: '\nEvo kako se igra kaladont:\n',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black87,
                          fontFamily: 'Montserrat',
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Kaladont je igra u kojoj može sudjelovati više igrača.\n\n'),
                          TextSpan(text: ' Ona počinje tako da jedan od igrača kaže prvu riječ,'),
                          TextSpan(text: ' a sljedeći koji igra treba od zadnja dva slova '),
                          TextSpan(text: 'prethodne riječi započet svoju riječ.\n\n'),
                          TextSpan(text: 'Cilj igre je da igrač kaže riječ s čija se zadnja dva slova ne može započeti nova riječ.\n\n'),
                          TextSpan(text: 'Također, ako netko kaže riječ koja završava s -ka onda on ispada iz igre.\n\n'),
                          TextSpan(text: '- Riječ mora biti poznata, a ne neka izmišljena i ne smije biti na stranom jeziku.\n',style: TextStyle(
                            fontSize: 18.0)),
                          TextSpan(text: '- Ne smiju se koristiti vlastita imena \n',style: TextStyle(
                              fontSize: 18.0)),
                          TextSpan(text: '- Ne smiju se koristiti skraćenice. \n',style: TextStyle(
                              fontSize: 18.0)),
                          TextSpan(text: '- Poželjno je da se riječi ne ponavljaju - dvije iste riječi u jednom krugu igre ne važe.\n',style: TextStyle(
                              fontSize: 18.0)),
                        ],
                      ),
                    )
                  ),
                ]
                ),
                const SizedBox(
                  height:10,
                  width: 200,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}
