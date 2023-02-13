import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MagicBall());

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int BallNumber = 3;
  void ProcessClick() {
    setState(() {
      BallNumber = Random().nextInt(5) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Ask Me Anything!"),
        ),
        body: Center(
          child: TextButton(
            child: Image.asset('images/ball$BallNumber.png'),
            onPressed: () {
              ProcessClick();
            },
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
