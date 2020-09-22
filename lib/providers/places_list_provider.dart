import 'package:flutter/material.dart';
import 'package:meals_app/models/place.dart';

class PlacesListProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get _places {
    return [..._items];
  }

}
