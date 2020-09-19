import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/providers/user.dart';
import 'package:meals_app/providers/users_list.dart';
import 'package:meals_app/tabs_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static final String routeName = '/register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _userData = User(userId: null, userName: '', userPassword: '');

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _doRegister() {
    final _validate = _form.currentState.validate();
    if (_validate) {
      _form.currentState.save();
      bool isAdded = Provider.of<UsersList>(context).addUser(_userData);
      if (isAdded) {
        Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
      } else {

      }
      print(Provider.of<UsersList>(context).items.length.toString());
      print(_userData.userId);
      print(_userData.userPassword);
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
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'User name',
                    errorStyle: TextStyle(color: Colors.red)),
                textInputAction: TextInputAction.next,
                maxLines: 1,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Please enter user name';
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
                  decoration: InputDecoration(labelText: 'Email'),
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  validator: (value) {
                    if (!validateEmail(value)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userData = User(
                        userName: _userData.userName,
                        userId: value,
                        userPassword: _userData.userPassword);
                  }),
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
                  }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    _doRegister();
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
