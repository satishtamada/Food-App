import 'package:flutter/material.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meals_item.dart';
import 'package:provider/provider.dart';

import 'providers/meal.dart';

class FavoriteScreen extends StatelessWidget {

  FavoriteScreen();

  @override
  Widget build(BuildContext context) {
    final favMeals =
        Provider.of<MealsProvider>(context).getFavMeals();
    if (favMeals.length == 0) {
      return Center(
        child: Text('No fav added '),
      );
    } else {
      return Container(
        child: ListView.builder(
            itemCount: favMeals.length,
            itemBuilder: (ctx, index) {
              return ChangeNotifierProvider.value(value: favMeals[index], child: MealItem(true));
            }),
      );
    }
  }
}



