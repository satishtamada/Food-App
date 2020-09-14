import 'package:flutter/material.dart';
import 'package:meals_app/models/data/meals_data.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = '/meals_details';
  Function toggleMeal;
  Function isFavMeal;

  MealDetailScreen(this.toggleMeal, this.isFavMeal);

  Widget getTitles(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == args['id']);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              selectedMeal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            getTitles(context, "Ingredients"),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 200,
              width: 300,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      )),
            ),
            getTitles(context, "Steps"),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white),
              height: 200,
              width: 300,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => ListTile(
                        leading: CircleAvatar(
                          maxRadius: 10,
                          child: Text('${index + 1}'),
                        ),
                        title: Container(
                          child: Text(selectedMeal.steps[index]),
                        ),
                      )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isFavMeal(args['id']) ? Icons.favorite : Icons.favorite_border),
        onPressed: ()=> toggleMeal(args['id']),
      ),
    );
  }
}
