import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals_item.dart';

import 'models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favMeals;

  FavoriteScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('No fav added '),
      );
    } else {
      return Container(
        child: ListView.builder(
            itemCount: favMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favMeals[index].id,
                title: favMeals[index].title,
                imageUrl: favMeals[index].imageUrl,
                duration: favMeals[index].duration,
                complexity: favMeals[index].complexity,
                affordability: favMeals[index].affordability,
              );
            }),
      );
    }
  }
}
