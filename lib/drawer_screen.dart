import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/profile_screen.dart';
import 'package:meals_app/providers/user.dart';
import 'package:meals_app/settings_screen.dart';
import 'package:provider/provider.dart';

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
    final user = Provider.of<User>(context);
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.pink,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(icon:Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                    size: 40,
                  ) ,onPressed: (){
                    Navigator.of(context).pushNamed(ProfileScreen.routeName);
                  },)
                  ,
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
            getListItem('Filters', Icons.filter_list, () {
              Navigator.of(context).popAndPushNamed(FiltersScreen.routeName);
            }),
            getListItem('Logout', Icons.power_settings_new, () {
              Navigator.of(context).pop();
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: Text('Logout from device..?'),
                        content: Text(
                            'Are you really want to logout from the device.'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                            },
                          ),
                          FlatButton(
                            child: Text('No'),
                            onPressed: () => Navigator.of(ctx).pop(),
                          )
                        ],
                      )).then((onValue) {
                if (onValue) {
                  //TODO logout
                }
              });
            }),
          ],
        ));
  }
}
