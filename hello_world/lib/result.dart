import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  String get resultPhrase =>
      "You answered correctly $score ${score > 1 ? "questions" : "question"}";

  Result(this.score, this.resetHandler);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text("restart!"),
              onPressed: resetHandler,
            )
          ],
        ),
      );
}
