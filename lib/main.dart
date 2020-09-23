import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meals_app/cart_screen.dart';
import 'package:meals_app/categroy_screen.dart';
import 'package:meals_app/login_screen.dart';
import 'package:meals_app/mapview_screen.dart';
import 'package:meals_app/meal_details_screen.dart';
import 'package:meals_app/meals_screen.dart';
import 'package:meals_app/models/data/meals_data.dart';
import 'package:meals_app/profile_screen.dart';
import 'package:meals_app/providers/cart.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/providers/user.dart';
import 'package:meals_app/providers/users_list.dart';
import 'package:meals_app/register_screen.dart';
import 'package:meals_app/settings_screen.dart';
import 'package:meals_app/tabs_screen.dart';
import 'package:meals_app/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'filters_screen.dart';
import 'providers/meal.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Map<String, bool> filters = {'veg': false, 'sugar_free': false};

  /*void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      mealsData = DUMMY_MEALS.where((test) {
        if (filters['veg'] && !test.isVegetarian) {
          return false;
        }
        if (filters['sugar_free'] && !test.isGlutenFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }*/

  /*void toggleMeals(String mealId) {
    final avalIndex = favMeals.indexWhere((meal) => meal.id == mealId);
    if (avalIndex >= 0) {
      setState(() {
        favMeals.removeAt(avalIndex);
      });
    } else {
      setState(() {
        favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavMeal(String mealId) {
    return favMeals.any((test) => test.id == mealId);
  }*/

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MealsProvider()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => User()),
        ChangeNotifierProvider(create: (ctx) => UsersList()),
      ],
      child: MaterialApp(
        title: 'Meals App',
        initialRoute: WelcomeScreen.routeName,
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(),
          MealScreen.routeName: (ctx) => MealScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          MapScreen.routeName: (ctx) => MapScreen(),
        },
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(225, 225, 225, 1),
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(21, 21, 21, 1)),
                body2: TextStyle(color: Color.fromRGBO(21, 21, 21, 1)),
                title: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyDashBoard();
}

class MyDashBoard extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FOOD APP"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => null,
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Text("hello"),
          ),
        ));
  }
}
