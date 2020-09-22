import 'package:flutter/cupertino.dart';

class User with ChangeNotifier{
  final String userName;
  final String userId;
  final String userPassword;
  bool isLogin;
  User(
      {@required this.userName,
      @required this.userId,
      @required this.userPassword,this.isLogin=false});
}
