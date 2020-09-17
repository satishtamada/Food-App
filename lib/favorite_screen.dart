import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals_item.dart';

import 'providers/meal.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favMeals=[];

  FavoriteScreen();

  @override
  Widget build(BuildContext context) {
    if (favMeals.length==0) {
      return Center(
        child: Text('No fav added '),
      );
    } else {
      return Container(
        child: ListView.builder(
            itemCount: favMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem();
            }),
      );
    }
  }
}
