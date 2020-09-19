import 'package:flutter/cupertino.dart';

class User with ChangeNotifier{
  final String userName;
  final String userId;
  final String userPassword;

  User(
      {@required this.userName,
      @required this.userId,
      @required this.userPassword});
}
