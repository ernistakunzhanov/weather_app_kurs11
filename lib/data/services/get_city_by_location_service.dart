import 'package:geolocator/geolocator.dart';

import 'package:weather_app_kurs/constants/api_key.dart';

import 'package:weather_app_kurs/utils/http_util.dart';

class GetLocationByCityService {
  static Future<void> getCityByLocation(Position position) async {
    HttpUtil.getHttp(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey');

    // String url =
    //     'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
    // Uri uri = Uri.parse(url);
    // final apiJoop = await client.get(uri);
    // final jsonData = apiJoop.body;
    // final jsonJoop = json.decode(jsonData) as Map<String, dynamic>;
    // // cityName = jsonJoop['name'];
    // final kelvin = jsonJoop['main']['temp'];
    // temp = WeatherUtil.calculateKelvin(kelvin);
    // description = WeatherUtil.getDescription(double.parse(temp));
    // icon = WeatherUtil.getWeatherIcon(kelvin);
  }

  static Future<void> getWeatherByCityName(String typeCityname) async {
    await HttpUtil.getHttp(
        'https://api.openweathermap.org/data/2.5/weather?q=$typeCityname&appid=$apiKey');
    // cityName = jsonData['name'];
    // final kelvin = jsonData['main']['temp'];
    // temp = WeatherUtil.calculateKelvin(kelvin);
    // description = WeatherUtil.getDescription(double.parse(temp));
    // icon = WeatherUtil.getWeatherIcon(kelvin);
  }
}
