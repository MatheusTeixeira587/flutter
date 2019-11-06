import 'package:expense_planner/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(_MyHomePage());

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Container(width: double.infinity, child: Text("Chart!")),
              elevation: 5,
            ),
            UserTransactions()
          ],
        ),
      ));
}
