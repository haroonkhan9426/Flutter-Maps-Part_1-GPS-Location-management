import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  BuildContext context;

  LocationService(this.context);

  getCurrentLocation() async {
    await checkPermissionStatus();
//    await checkGpsService();
    Position currentLocation =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return currentLocation;
    print('${currentLocation.latitude}, ${currentLocation.longitude}');
  }

  Future<Stream> getCurrentLocationStream() async {
    await checkPermissionStatus();
//    await checkGpsService();
    final stream = getPositionStream(desiredAccuracy: LocationAccuracy.best);
    return stream;
  }

  checkPermissionStatus() async {
    LocationPermission permission = await checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await requestPermission();
    }
  }

  checkGpsService() async {
    if (!await isLocationServiceEnabled()) {
      showDialog(
        context: context,
        child: AlertDialog(
          title: Text('GPS is Disabled'),
          content: Text('Please turn on your GPS Location'),
          actions: [
            RaisedButton(
              child: Text('TURN ON'),
              onPressed: () async {
                await openLocationSettings();
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text('Skip'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }
}
