import 'package:flutter/material.dart';
import 'package:hello_world/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function handleAnswerSelected;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.handleAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions.elementAt(questionIndex)["question"]),
        ...(questions.elementAt(questionIndex)["answers"] as List<Map<String, Object>>)
            .map((answer) =>
                Answer(text: answer["text"], answerHandler: () => handleAnswerSelected(answer["correct"])))
            .toList()
      ],
    );
  }
}
