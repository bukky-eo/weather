import 'package:flutter/material.dart';
import 'package:weather_app/helpers/widgets.dart';
import 'package:weather_app/screens/home.dart';

import '../services/weather.dart';
import 'locations.dart';

const apiKey = '1493864600c823e4543aa830fb74277e';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    if (weatherData != null) {
      return Home(
          // locationWeather: weatherData,
          );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white60,
        ),
      ),
    );
  }
}
