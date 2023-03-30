import 'package:flutter/material.dart';

const List<String> list = <String>['easy', 'medium', 'hard'];

class LevelChoose extends StatefulWidget {
  const LevelChoose({Key? key}) : super(key: key);

  @override
  State<LevelChoose> createState() => _State();
}

String holder = "medium";
String getLevel(){
  return holder;
}

class _State extends State<LevelChoose> {
  String dropdownValue = holder;
  void getDropDownItem(){
    holder = dropdownValue ;
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(

      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 10,
      style: const TextStyle(
          color: Colors.blue,
        fontSize: 25,
      ),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          getDropDownItem();
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

