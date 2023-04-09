import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app_kurs/data/repositories/geo_location_repo.dart';
import 'package:weather_app_kurs/data/repositories/get_location_by_city_repo.dart';

class HomeController extends GetxController {
  Rx<String> cityName = 'Shaar kele jatat'.obs;
  RxString temp = ''.obs;
  RxString description = ''.obs;
  RxString icon = ''.obs;

  @override
  void onInit() {
    showLocation();
    super.onInit();
  }

  void showLocation() async {
    final position = GeoLocationRepo() as Position;
    await GetLocationByCityRepo.getCityByLocation(position);
  }
}
