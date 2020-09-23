import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static final String routeName = '/mapscreen';

  MapScreen();

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var userLat;
  var userLng;
  bool isChangedDependenices = false;

  @override
  void didChangeDependencies() {
    if (!isChangedDependenices) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      userLat = double.parse(args['lat']);
      userLng = double.parse(args['lng']);

      isChangedDependenices = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    /*final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    userLat = args['lat'] as double;
    userLng = args['lng'] as double;*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      backgroundColor: Colors.white,
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(userLat, userLng), zoom: 18),
        markers: {
          Marker(markerId: MarkerId('mq'), position: LatLng(userLat, userLng))
        },
      ),
    );
  }
}
