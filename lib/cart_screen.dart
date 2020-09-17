import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static final String routeName = '/cart';

  Widget getBody(Cart cart, BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Card(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total your cart',
              ),
              Chip(
                label: Text(
                  '\$${cart.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.title.color,
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        )),
      ),
      Flexible(
        flex: 1,
        child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: cart.items.values.toList()[index].image == null
                    ? Image.network(
                        "https://lh3.googleusercontent.com/proxy/PeH-52ciNUbbRrbmbk7R6Swy8PN7_lGDo8RLYwX4cgXD7DGy5znhe-eAPeBXOhfmhWqXLPULMUxnAC12sRWHjyWjKQplVQJxdgt1xpEOL_umxMlF8wNGAmX7vyS6",
                        width: 80,
                        height: 80,
                      )
                    : Image.network(
                        cart.items.values.toList()[index].image,
                        width: 80,
                        height: 80,
                      ),
                title: Text(cart.items.values.toList()[index].title),
                subtitle:
                    Text('QTY: ${cart.items.values.toList()[index].quantity}'),
              );
            }),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cart.items.length == 0
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.grey,
                  size: 100,
                ),
                Text('Your cart is empty..!'),
              ],
            ))
          : getBody(cart, context),
    );
  }
}
