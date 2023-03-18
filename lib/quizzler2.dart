import 'quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  int num_correct = 0, num_wrong = 0;
  QuizBrain _quiz_brain = QuizBrain();
  List<Icon> scoreKeeper = [];
  void createAnswer(bool answer) {
    if (_quiz_brain.checkAnswerAndInc(answer)) {
      num_correct++;
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      num_wrong++;
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child:
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      _quiz_brain.getQuestion(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                flex: 5,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    child: Text('yes'),

                    onPressed: () {
                      setState(() {
                        if (_quiz_brain.isFinished()) {
                          Alert(context: context, title: "RFLUTTER", desc: "Questions are done").show();
                        }
                        createAnswer(true);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    child: Text('No'),
                    onPressed: () {
                      setState(() {
                        if (_quiz_brain.isFinished()) {
                          Alert(context: context, title: "RFLUTTER", desc: "Questions are done").show();
                        }
                        createAnswer(false);
                      });
                    },
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                    children: scoreKeeper
                ),
              ),
            ],

          ),

        ),
      ),
    );
  }
}
