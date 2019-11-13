import 'package:expense_planner/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Personal Expenses",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.purpleAccent,
          fontFamily: "Quicksand",
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        home: HomePage(),
      );
}
