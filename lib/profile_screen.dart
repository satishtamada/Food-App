import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meals_app/providers/users_list.dart';
import 'package:meals_app/widgets/image_picker.dart';
import 'package:meals_app/widgets/location_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = 'profile_screen';
  File savedImage;

  void saveImageFile(File selectedImage) {
    savedImage = selectedImage;
  }

  void saveProfileData(BuildContext context) {
    Provider.of<UsersList>(context).addProfileImage("satish", savedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          FlatButton(
            child: Text('save'),
            onPressed: () {
              saveProfileData(context);
            },
          )
        ],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    CustomImagePicker(saveImageFile),
                    CustomLocationPicker(),
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
