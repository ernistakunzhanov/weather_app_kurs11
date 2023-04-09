import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_kurs/data/services/get_city_by_location_service.dart';
import 'package:weather_app_kurs/modules/home/controller/home_controller.dart';
import 'package:weather_app_kurs/utils/http_util.dart';

import 'package:weather_app_kurs/modules/search/search_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height * 1,
          width: size.width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/weather.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.location_on,
                  size: 60,
                  color: Colors.white,
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
                    // await getWeatherByCityName(weatherResult);
                    await GetLocationByCityService.getWeatherByCityName(
                        weatherResult);
                  },
                  child: Icon(
                    Icons.location_city,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: Text(
                  '${HttpUtil.} ℃ ',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                ),
              ),
              Positioned(
                top: 350,
                left: 100,
                child: Text(
                  '''$description
''',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
              Positioned(
                top: 120,
                left: 170,
                child: Text(
                  '$icon',
                  style: TextStyle(fontSize: 70, color: Colors.yellow),
                ),
              ),
              Positioned(
                top: 430,
                right: 0,
                child: Text(
                  '🧣 🧤',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 50,
                child: Text(
                  cityName,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
