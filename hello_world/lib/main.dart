import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/quiz.dart';
import 'package:hello_world/result.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  final _questions = const [
    {
      "question": "Who named our planet earth?",
      "answers": [
        {"text": "Me", "correct": false},
        {"text": "Nostradamus", "correct": false},
        {"text": "We don\'t know", "correct": true},
      ],
    },
    {
      "question": "Is The Earth Flat?",
      "answers": [
        {"text": "i\'m very dumb (yes)", "correct": false},
        {"text": "No", "correct": true},
        {
          "text": "My brain cells die from loneliness (also yes)",
          "correct": false
        },
      ],
    },
    {
      "question": "Can vaccines cause autism?",
      "answers": [
        {"text": "i\'m very dumb (yes)", "correct": false},
        {"text": "No", "correct": true},
        {
          "text": "My brain cells die from loneliness (also yes)",
          "correct": false
        },
      ]
    },
  ];

  void _answerQuestion(bool nailed) {
    setState(() {
      _currentIndex++;
      _correctAnswers += nailed ? 1 : 0;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _correctAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My quiz!"),
      ),
      body: _currentIndex < _questions.length
          ? Quiz(
              questions: _questions,
              questionIndex: _currentIndex,
              handleAnswerSelected: _answerQuestion,
            )
          : Result(_correctAnswers, _resetQuiz),
    ));
  }
}
