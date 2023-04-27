import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_kurs/app/constants/api_key.dart';
import 'package:weather_app_kurs/app/constants/color/app_colors.dart';
import 'package:weather_app_kurs/app/constants/decoration/app_decoration.dart';
import 'package:weather_app_kurs/app/constants/text_style/app_text_style.dart';
import 'package:weather_app_kurs/app/utils/weather_util.dart';
import 'package:weather_app_kurs/app/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String cityName = 'Shaar kele jatat';
  String temp = '';
  String description = '';
  String icon = '';
  @override
  void initState() {
    showLocation();
    super.initState();
  }

  void showLocation() async {
    final position = await _getCurrentPosition();
    await getCityByLocation(position);
  }

  Future<void> getWeatherByCityName(String typeCityname) async {
    final client = http.Client();
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$typeCityname&appid=$apiKey';
      Uri uri = Uri.parse(url);
      final response = await client.get(uri);
      final jsonData = jsonDecode(response.body);
      cityName = jsonData['name'];
      final kelvin = jsonData['main']['temp'];
      temp = WeatherUtil.calculateKelvin(kelvin);
      description = WeatherUtil.getDescription(double.parse(temp));
      icon = WeatherUtil.getWeatherIcon(kelvin);
    } catch (e) {
      throw e;
    }
  }

  Future<void> getCityByLocation(Position position) async {
    final client = http.Client();
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
      Uri uri = Uri.parse(url);
      final apiJoop = await client.get(uri);
      final jsonData = apiJoop.body;
      final jsonJoop = json.decode(jsonData) as Map<String, dynamic>;
      cityName = jsonJoop['name'];
      final kelvin = jsonJoop['main']['temp'];
      temp = WeatherUtil.calculateKelvin(kelvin);
      description = WeatherUtil.getDescription(double.parse(temp));
      icon = WeatherUtil.getWeatherIcon(kelvin);
      setState(() {});
    } catch (e) {
      Exception(e);
      rethrow;
    }

    setState(() {});
  }
  /*

  CRUD
  C - Create 
  R - Read - get
  U - Update
  D - Delete
   */

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height * 1,
          width: size.width * 1,
          decoration: AppDecoration.screenDecoration,
          child: Stack(
            children: [
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.location_on,
                  size: 60,
                  color: AppColors.white,
                ),
              ),
              Positioned(
                right: 0,
                child: TextButton(
                  onPressed: () async {
                    final weatherResult = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchView(),
                      ),
                    );
                    await getWeatherByCityName(weatherResult);
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.location_city,
                    size: 60,
                    color: AppColors.white,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: Text(
                  '$temp ℃ ',
                  style: AppTextStyle.black80,
                ),
              ),
              Positioned(
                top: 350,
                left: 100,
                child: Text(
                  '''$description
''',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.black40,
                ),
              ),
              Positioned(
                top: 120,
                left: 170,
                child: Text(
                  '$icon',
                  style: AppTextStyle.yellow70,
                ),
              ),
              const Positioned(
                top: 430,
                right: 0,
                child: Text(
                  '🧣 🧤',
                  style: AppTextStyle.white60,
                ),
              ),
              Positioned(
                bottom: 50,
                left: 50,
                child: Text(
                  cityName,
                  style: AppTextStyle.white40w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
