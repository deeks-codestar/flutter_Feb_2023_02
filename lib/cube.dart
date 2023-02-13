import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DicePage());
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 6;
  void ProcessClick() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.red,
        body: Center(
          child: Row(
            // This doesn't work thus used Center to wrap around this.
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child:
                TextButton(
                  child: Image(image: AssetImage('images/dice$leftDiceNumber.png')),
                  onPressed: (){
                    ProcessClick();
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image(image: AssetImage('images/dice$rightDiceNumber.png')),
                  onPressed: () {
                    ProcessClick();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
