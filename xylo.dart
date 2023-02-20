import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(Xylo());

class Xylo extends StatefulWidget {
  @override
  _XyloState createState() => _XyloState();
}

class _XyloState extends State<Xylo> {
  Widget CreateKey(Color input_color) {
    return Expanded(
      child:TextButton(
        child: Container(
          color: input_color,
        ),
        onPressed: () {
          print("Pressed: $input_color");
          final player = AudioPlayer();
          player.play(AssetSource('assets_note2.wav'));
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            CreateKey(Colors.red),
            CreateKey(Colors.green),
            CreateKey(Colors.purple),
            CreateKey(Colors.yellow),
            CreateKey(Colors.pink),
          ],
        ),
      ),
    );
  }
}
