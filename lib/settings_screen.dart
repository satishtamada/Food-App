import 'package:flutter/material.dart';
class SettingsScreen extends StatelessWidget {
   static String routeName='settings_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Settings'),),
      body: Center(child: Text('child'),),
    );
  }
}
