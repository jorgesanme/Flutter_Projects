import 'package:geolocator/geolocator.dart';

class Location {
  double latitud;
  double longitud;

  Future<void> getCurrentLocation() async {
    try {
      Geolocator().forceAndroidLocationManager = true;
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitud = position.latitude;
      longitud = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
