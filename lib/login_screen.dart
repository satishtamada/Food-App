import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/providers/user.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFocusNode = FocusNode();
  final _form=GlobalKey<FormState>();
  final _userData=User(userId: null,userName: '',userPassword: '');

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _doLogin() {
    _form.currentState.save();
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
                onSaved: (value){

                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                textInputAction: TextInputAction.next,
                maxLines: 1,
                obscureText: true,
                focusNode: _passwordFocusNode,
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
