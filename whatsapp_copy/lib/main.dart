import 'package:flutter/material.dart';
import 'package:whatsapp_copy/constants/constants.dart';
import 'package:whatsapp_copy/pages/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final ThemeData _theme = ThemeData(primarySwatch: Constants.mainColor, accentColor: Constants.mainColorAccent);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp',
      theme: _theme
      ,
      home: MainPage(),
    );
  }
}
