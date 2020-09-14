import 'package:flutter/material.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/settings_screen.dart';

class DrawerScreen extends StatelessWidget {
  Widget getListItem(String title, IconData iconData, Function function) {
    return ListTile(
      title: Text(title),
      leading: Icon(iconData),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.pink,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.restaurant,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Meal App',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            getListItem('Home', Icons.home, () {
              Navigator.of(context).popAndPushNamed('/');
            }),
            getListItem('Settings', Icons.settings, () {
              Navigator.of(context).popAndPushNamed(SettingsScreen.routeName);
            }),
            getListItem('Filters', Icons.filter_list, () {
              Navigator.of(context).popAndPushNamed(FiltersScreen.routeName);
            }),
          ],
        ));
  }
}
