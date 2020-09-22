import 'dart:io';

class PlaceLocation {
  final String address;
  final double lat;
  final double logi;

  PlaceLocation({this.address, this.lat, this.logi});
}

class Place {
  final String title;
  final String id;
  final File image;
  final PlaceLocation placeLocation;

  Place({this.title, this.id, this.image, this.placeLocation});
}
