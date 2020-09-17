import 'package:flutter/material.dart';
import 'package:meals_app/cart_screen.dart';
import 'package:meals_app/providers/cart.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/badge.dart';
import 'package:provider/provider.dart';

import 'providers/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = '/meals_details';

  /*Function toggleMeal;
  Function isFavMeal;*/

  //MealDetailScreen(this.toggleMeal, this.isFavMeal);

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
        Provider.of<MealsProvider>(context).findById(args['id']);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
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
          ),
          Container(
            margin: EdgeInsets.all(5),
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.white,
                ),
                FlatButton(
                  onPressed: () {
                    cart.addItem(selectedMeal.id, selectedMeal.price,
                        selectedMeal.title,selectedMeal.imageUrl);
                  },
                  child: Text(
                    'Add cart',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
