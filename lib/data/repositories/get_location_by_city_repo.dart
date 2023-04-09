import 'package:geolocator/geolocator.dart';
import 'package:weather_app_kurs/data/services/get_city_by_location_service.dart';

class GetLocationByCityRepo {
  static Future getCityByLocation(Position position) async {
    return await GetLocationByCityService.getCityByLocation(position);
  }
}
