import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_blog_part1/services/location_service.dart';

class RealtimeLocationUpdateExample extends StatefulWidget {
  @override
  _RealtimeLocationUpdateExampleState createState() =>
      _RealtimeLocationUpdateExampleState();
}

class _RealtimeLocationUpdateExampleState
    extends State<RealtimeLocationUpdateExample> {
  Position currentLocation;
  var locationService;

  @override
  void initState() {
    locationService = LocationService(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Location Management'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///
          /// Current Location Text Widget
          ///
          Center(
              child: currentLocation != null
                  ? Text(
                      "Lat: ${currentLocation?.latitude}, Long: ${currentLocation?.longitude}")
                  : Text('Current Location Not set yet')),

          SizedBox(height: 40),

          ///
          /// Realtime Location updates Button
          ///
          RaisedButton(
            child: Text('Get Realtime Updates'),
            onPressed: () async {
              final Stream stream =
                  await LocationService(context).getCurrentLocationStream();
              stream.listen((position) {
                setState(() {
                  currentLocation = position;
                });
              });
            },
          )
        ],
      ),
    );
  }
}
