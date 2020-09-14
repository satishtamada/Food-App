import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meals_app/categroy_screen.dart';
import 'package:meals_app/meal_details_screen.dart';
import 'package:meals_app/meals_screen.dart';
import 'package:meals_app/models/data/meals_data.dart';
import 'package:meals_app/settings_screen.dart';
import 'package:meals_app/tabs_screen.dart';

import 'filters_screen.dart';
import 'models/meal.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Map<String, bool> filters = {'veg': false, 'sugar_free': false};
  List<Meal> mealsData = DUMMY_MEALS;
  List<Meal> favMeals = [];

  void setFilters(Map<String, bool> filterData) {
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
  }

  void toggleMeals(String mealId) {
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favMeals),
        'meals': (ctx) => MealScreen(mealsData),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(toggleMeals,isFavMeal),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, setFilters),
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
