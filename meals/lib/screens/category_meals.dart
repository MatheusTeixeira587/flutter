import 'package:flutter/material.dart';
import 'package:meals/mocks/dart/dummy-data.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final meals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(routeArgs["id"]));

    return Scaffold(
      appBar: AppBar(title: Text(routeArgs["title"])),
      body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            final current = meals.elementAt(index);

            return MealItem(
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
