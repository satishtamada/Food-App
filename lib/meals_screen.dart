import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meals_item.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealsList =
        Provider.of<MealsProvider>(context).getMealsByCategoryId(args['id']);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(args['title']),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int value) {
              if (value == 0) {
              } else {}
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Fav'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: 0,
              ),
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: mealsList.length,
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider.value(
                value: mealsList[index], child: MealItem());
          }),
    );
  }
}
