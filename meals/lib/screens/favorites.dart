import 'package:flutter/cupertino.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  const FavoritesScreen({Key key, this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? Center(
            child: Text("No favorites yet"),
          )
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (ctx, index) {
              final current = favorites.elementAt(index);

              return MealItem(
                id: current.id,
                title: current.title,
                imageUrl: current.imageUrl,
                duration: current.duration,
                affordability: current.affordability,
                complexity: current.complexity,
              );
            });
  }
}
