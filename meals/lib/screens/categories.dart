import 'package:flutter/material.dart';
import 'package:meals/mocks/dart/dummy-data.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((category) =>
              CategoryItem(category.id, category.title, category.color))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
