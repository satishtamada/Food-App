import 'package:flutter/material.dart';
import 'package:meals_app/login_screen.dart';
import 'package:meals_app/register_screen.dart';
import 'package:meals_app/tabs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static final String routeName = '/welcome_scree';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: FlatButton(
                  child: Text('SKIP'),
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.restaurant,
                      size: 100,
                      color: Colors.grey,
                    ),
                    Text(
                      'Food App',
                      style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.white,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
