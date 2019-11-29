import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, String> _routeArgs;
  List<Meal> _meals;
  var _isFullyLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isFullyLoaded) {
      _routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      _meals = widget.meals
          .where((meal) => meal.categories.contains(_routeArgs["id"]))
          .toList();

      _isFullyLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_routeArgs["title"])),
      body: ListView.builder(
          itemCount: _meals.length,
          itemBuilder: (ctx, index) {
            final current = _meals.elementAt(index);

            return MealItem(
              id: current.id,
              title: current.title,
              imageUrl: current.imageUrl,
              duration: current.duration,
              affordability: current.affordability,
              complexity: current.complexity,
            );
          }),
    );
  }
}
