import 'package:flutter/material.dart';
import 'package:meals/mocks/dart/dummy-data.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/category_meals.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/screens/tabs.dart';

import 'constants/constants.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = {
    "gluten": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false,
  };

  var _meals = DUMMY_MEALS;
  List<Meal> _favorites = [];

  void _toogleFavorite(String mealId) {
    final find = (Meal meal) => meal.id == mealId;
    final favorited = _favorites.indexWhere(find);

    setState(() {
      favorited >= 0
          ? _favorites.removeWhere(find)
          : _favorites.add(DUMMY_MEALS.firstWhere(find));
    });
  }

  bool _isMealFavorite(String mealId) =>
      _favorites.any((meal) => meal.id == mealId);

  void _setFilters(Map<String, bool> filter) => setState(() {
        _filters = filter;
        _meals = DUMMY_MEALS.where((meal) {
          if (_filters["gluten"] && !meal.isGlutenFree) return false;
          if (_filters["vegan"] && !meal.isVegan) return false;
          if (_filters["vegetarian"] && !meal.isVegetarian) return false;
          if (_filters["lactose"] && !meal.isLactoseFree) return false;

          return true;
        }).toList();
      });

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
        TabsScreen.routeName: (ctx) => TabsScreen(favorites: _favorites),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_meals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
            toogleFavorite: _toogleFavorite, isFavorite: _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
      },
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (ctx) => TabsScreen()),
    );
  }
}
