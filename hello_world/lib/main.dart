import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  int currentIndex = 0;
  final questions = [
    "What\'s your favorite color?",
    "What\'s your favorite animal?",
  ];

  void answerQuestion() {
    print('answer chosen');
    currentIndex++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My quiz!"),
      ),
      body: Column(
        children: [
          Text(questions.elementAt(currentIndex > questions.length ? 0 : currentIndex)),
          RaisedButton(
            child: Text("Answer 1 for question $currentIndex"),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text("Answer 2 for question $currentIndex"),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text("Answer 3 for question $currentIndex"),
            onPressed: answerQuestion,
          ),
        ],
      ),
    ));
  }
}
