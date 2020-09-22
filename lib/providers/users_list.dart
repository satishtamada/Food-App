import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meals_app/providers/user.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/utils/constants.dart';
import 'package:convert/convert.dart';

class UsersList with ChangeNotifier {
  List<User> _users = [];

  List<User> get items {
    return [..._users];
  }

  Future<void> addUser(User inputUser) {
    http.post(Constants.baseUrl + Constants.USERS,
            body: json.encode({
              'userId': inputUser.userId,
              'userName': inputUser.userName,
              'userPassword': inputUser.userPassword
            }))
        .then((response) {
      print(json.decode(response.body));
      _users.add(inputUser);
    }).catchError((onError) {
      print(onError.toString());
      throw onError;
    });
  }

  bool doLogin(User inputUser) {
    if (_users.length == 0) {
      return false;
    } else {
      var isUserAvailbe = false;
      var index = 0;
      for (var i = 0; i < _users.length; i++) {
        if (_users[i].userId == inputUser.userId) {
          isUserAvailbe = true;
          index = i;
        }
      }
      if (!isUserAvailbe) {
        _users.removeAt(index);
        inputUser.isLogin = true;
        _users.add(inputUser);
        return true;
      }
      return false;
    }
  }
}
