import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_item.dart';

class MealScreen extends StatefulWidget {
  List<Meal> mealsData;

  MealScreen(this.mealsData);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String title;
  List<Meal> mealsList;
  var isChangedDependenices = false;

  @override
  void didChangeDependencies() {
    if (!isChangedDependenices) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = args['title'];
      final id = args['id'];
      mealsList = widget.mealsData.where((mealData) {
        return mealData.categories.contains(id);
      }).toList();
      isChangedDependenices = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void removeItem(String id) {
    print(id);
    setState(() {
      mealsList.removeWhere((test) => test.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: mealsList.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: mealsList[index].id,
              title: mealsList[index].title,
              imageUrl: mealsList[index].imageUrl,
              duration: mealsList[index].duration,
              complexity: mealsList[index].complexity,
              affordability: mealsList[index].affordability);
          }),
    );
  }
}
