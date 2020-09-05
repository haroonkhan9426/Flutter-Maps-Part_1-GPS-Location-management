import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_blog_part1/services/location_service.dart';
import 'package:maps_blog_part1/ui/current_location_example.dart';
import 'package:maps_blog_part1/ui/realtime_location_update_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
            child: RaisedButton(
              child: Text('Current Location'),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurrentLocationExample()));
              },
            ),
          ),

          SizedBox(height: 40),

          ///
          /// Get Current Location Button
          ///
          RaisedButton(
            child: Text('Realtime Location Updates'),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RealtimeLocationUpdateExample()));
            },
          )
        ],
      ),
    );
  }
}
