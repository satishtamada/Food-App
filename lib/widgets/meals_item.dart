import 'package:flutter/material.dart';
import 'package:meals_app/meal_details_screen.dart';
import 'package:meals_app/providers/meal.dart';
import 'package:provider/provider.dart';

class MealItem extends StatelessWidget {
  bool isFromFav = false;

  MealItem(this.isFromFav);

  void selectedMeal(BuildContext ctx, Meal meal) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: {'id': meal.id});
  }

  String complexityName(Meal meal) {
    if (meal.complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (meal.complexity == Complexity.Hard) {
      return 'Hard';
    }
    if (meal.complexity == Complexity.Challenging) {
      return 'Challenging';
    }
    return 'NON';
  }

  String affordabilityName(Meal meal) {
    if (meal.affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (meal.complexity == Affordability.Luxurious) {
      return 'Luxurious';
    }
    if (meal.complexity == Affordability.Pricey) {
      return 'Pricey';
    }
    return 'NON';
  }

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);
    return ChangeNotifierProvider(
      create: (ctx) => Meal(),
      child: InkWell(
        onTap: () => selectedMeal(context, meal),
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      meal.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (!isFromFav)
                    Positioned(
                      top: 20,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            icon: Icon(
                              meal.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.pinkAccent,
                            ),
                            onPressed: () {
                              meal.toggleFav();
                            }),
                      ),
                    ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      width: 250,
                      color: Color.fromRGBO(0, 0, 0, 90),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        SizedBox(width: 6),
                        Text(meal.duration.toString())
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(complexityName(meal))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(affordabilityName(meal))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
