import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  var index = 0;
  int num_correct = 0, num_wrong = 0;
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    "Who is smart",
    "Why do you think this is good?",
    "I can't do this right now?",
    "My head is spining?",
  ];
  List<bool> answers = [
    true, false, true, false,
  ];
  void createAnswer(bool answer) {
    if (answer == answers[index]) {
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
    index = (index+1)% questions.length;
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
                      questions[index],
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
