import 'package:geolocator/geolocator.dart';
import 'package:weather_app_kurs/data/services/geo_location_service.dart';

class GeoLocationRepo {
  static Future<Position> getCurrentPosition() async {
    return await GeoLocationService.getCurrentPosition();
  }
}
