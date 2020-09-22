import 'package:flutter/material.dart';
import 'package:meals_app/widgets/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    CustomImagePicker(),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
