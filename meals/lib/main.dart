import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/category_meals.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/screens/tabs.dart';

import 'constants/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
      initialRoute: CategoriesScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (ctx) => TabsScreen()),
    );
  }
}
