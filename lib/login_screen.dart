import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meals_app/providers/user.dart';
import 'package:meals_app/providers/users_list.dart';
import 'package:meals_app/tabs_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _userData = User(
    userId: null,
    userName: '',
    userPassword: '',
  );

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _doLogin() {
    final _validate = _form.currentState.validate();
    if (_validate) {
      _form.currentState.save();
      bool isLoggedIn = Provider.of<UsersList>(context).doLogin(_userData);
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
      } else {
        Fluttertoast.showToast(
            msg: "Not registered ..!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  bool validateEmail(String input) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
    return emailValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'User name'),
                textInputAction: TextInputAction.next,
                maxLines: 1,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty || !validateEmail(value)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userData = User(
                      userName: value,
                      userId: _userData.userId,
                      userPassword: _userData.userPassword);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                textInputAction: TextInputAction.next,
                maxLines: 1,
                obscureText: true,
                focusNode: _passwordFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userData = User(
                      userName: _userData.userName,
                      userId: _userData.userId,
                      userPassword: value);
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    _doLogin();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
