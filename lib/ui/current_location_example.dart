import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_blog_part1/services/location_service.dart';

class CurrentLocationExample extends StatefulWidget {
  @override
  _CurrentLocationExampleState createState() => _CurrentLocationExampleState();
}

class _CurrentLocationExampleState extends State<CurrentLocationExample> {
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
          /// Get Current Location Button
          ///
          RaisedButton(
            child: Text('Get Current Location'),
            onPressed: () async {
              currentLocation =
                  await LocationService(context).getCurrentLocation();
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
