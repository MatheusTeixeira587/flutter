import 'package:flutter/material.dart';
import 'package:meals/mocks/dart/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  Widget buildSectionTitle(String title, ThemeData theme) => Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: theme.textTheme.title));

  Widget buildListContainer(ListView list) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: list,
      );

  @override
  Widget build(BuildContext context) {
    final _mealId = ModalRoute.of(context).settings.arguments as String;
    final _meal = DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId);
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(_meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  _meal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildSectionTitle("Ingredients", _theme),
            buildListContainer(
              ListView.builder(
                itemCount: _meal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: _theme.accentColor,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(_meal.ingredients.elementAt(index))),
                ),
              ),
            ),
            buildSectionTitle("Steps", _theme),
            buildListContainer(ListView.builder(
              itemCount: _meal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(_meal.steps.elementAt(index)),
                  ),
                  Divider()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
