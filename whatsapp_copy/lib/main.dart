import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_copy/constants/constants.dart';
import 'package:whatsapp_copy/pages/mainPage.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData _theme = ThemeData(
    primaryColor: Constants.mainColor,
    accentColor: Constants.mainColorAccent,
    indicatorColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(elevation: 0.7, color: Constants.mainColor),
    cardTheme: CardTheme(
      margin: EdgeInsets.only(bottom: 2),
      elevation: 0,
    ),
    textTheme: TextTheme().copyWith(
        title: TextStyle(fontWeight: FontWeight.normal),
        subtitle: TextStyle(color: Colors.grey),
        caption: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(splashColor: Constants.mainColorAccent),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Constants.mainColorDark));
    return MaterialApp(
      title: 'Whatsapp',
      theme: _theme,
      home: MainPage(cameras),
    );
  }
}
