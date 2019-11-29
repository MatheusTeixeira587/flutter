import 'package:flutter/material.dart';
import 'package:meals/mocks/dart/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  final Function(String) toogleFavorite;
  final Function(String) isFavorite;

  const MealDetailScreen({Key key, this.toogleFavorite, this.isFavorite})
      : super(key: key);

  Widget buildSectionTitle(String title, ThemeData theme) => Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: theme.textTheme.title));

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
            ..._meal.ingredients.map((ingredient) => Card(
                color: _theme.accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                      height: 30,
                      width: 250,
                      child: Center(child: Text(ingredient))),
                ))),
            buildSectionTitle("Steps", _theme),
            ..._meal.steps.map((step) {
              final index = _meal.steps.indexOf(step);
              return Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Center(child: Text("# ${index + 1}")),
                  ),
                  title: Text(step),
                ),
                const Divider()
              ]);
            }),
            Padding(
              padding: const EdgeInsets.all(35),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(_mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toogleFavorite(_mealId),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

/*

*/
