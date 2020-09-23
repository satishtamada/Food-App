import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:meals_app/mapview_screen.dart';

class CustomLocationPicker extends StatefulWidget {
  @override
  _CustomLocationPickerState createState() => _CustomLocationPickerState();
}

class _CustomLocationPickerState extends State<CustomLocationPicker> {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  double userLat = 0.0;
  double userLng = 0.0;

  void getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    if (_locationData != null) {
      setState(() {
        userLat = _locationData.latitude;
        userLng = _locationData.longitude;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: userLng != 0.0
              ? Container(
                  child: Column(
                    children: <Widget>[
                      Text(userLat.toString()),
                      Text(userLng.toString()),
                    ],
                  ),
                )
              : Text(
                  'No Location',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        Container(
          child: FlatButton.icon(
            icon: Icon(Icons.location_searching),
            label: Text('Select Location'),
            textColor: Colors.blue,
            onPressed: () {
              getLocation();
            },
          ),
        ),
        Container(
          child: FlatButton.icon(
            icon: Icon(Icons.map),
            label: Text('Select Location MAP'),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushNamed(MapScreen.routeName, arguments: {
                "lat": userLat.toString(),
                "lng": userLng.toString()
              });
            },
          ),
        ),
      ],
    );
    ;
  }
}
