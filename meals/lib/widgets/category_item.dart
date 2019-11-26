import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void handleSelect(BuildContext context) =>
        Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
            arguments: {"id": id, "title": title});

    return InkWell(
      onTap: () => handleSelect(context),
      splashColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: theme.textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
