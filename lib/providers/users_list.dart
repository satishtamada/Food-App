import 'package:flutter/material.dart';
import 'package:meals_app/providers/user.dart';

class UsersList with ChangeNotifier {
  List<User> _users = [];

  List<User> get items {
    return [..._users];
  }

  bool addUser(User inputUser) {
    if (_users.length == 0) {
      _users.add(inputUser);
      return true;
    } else {
      var isUserAvailbe = false;
      for (var i = 0; i < _users.length; i++) {
        if (_users[i].userId == inputUser.userId) {
          isUserAvailbe = true;
        }
      }
      if (!isUserAvailbe) {
        _users.add(inputUser);
      }
      return false;
    }
  }
}
