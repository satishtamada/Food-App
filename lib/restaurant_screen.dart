import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurants'),actions: <Widget>[
        IconButton(icon: Icon(Icons.add),onPressed: null,)
      ],),
      body: Center(),
    );
  }
}
