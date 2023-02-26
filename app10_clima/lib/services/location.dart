import 'package:geolocator/geolocator.dart';

class Location {
  late double _latitude;
  late double _longitude;

  Future<void> getLocation() async {
    LocationPermission permission;
    Position pos;

    try {
      await Geolocator.isLocationServiceEnabled();
    } catch (err) {
      Future.error('Location services are disabled. --> $err');
    }

    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    } catch (e) {
      Future.error('error --> $e');
    }

    try {
      pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _longitude = pos.longitude;
      _latitude = pos.latitude;
    } catch (e) {
      Future.error('ERR --> $e');
    }
  }

  double get longitude => _longitude;

  double get latitude => _latitude;
}
