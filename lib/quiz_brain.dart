import 'dart:js';

import 'question.dart';

class QuizBrain {
  List<QuestionAndAns> _questionAns = [
    QuestionAndAns("What is fun?", true),
    QuestionAndAns("Color of sky is green?", false),
    QuestionAndAns("Why is there boo", true),
  ];
  int _questionNumber = 0;

  String getQuestion() {
    return _questionAns[_questionNumber].question;
  }

  bool checkAnswerAndInc(bool user_ans) {
    bool ret_value = false;
    if (_questionAns[_questionNumber] == user_ans) {
      ret_value = true;
    } else {
      ret_value = false;
    }
    _questionNumber = _questionNumber + 1;
    return ret_value;
  }
  bool isFinished() {
    if (_questionNumber >= _questionAns.length - 1) {
      return true;
    }
    return false;
  }
}