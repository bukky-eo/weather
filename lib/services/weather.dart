import 'networking.dart';
import 'package:weather_app/services/locations.dart';

class WeatherModel {
  String apiKey = '2400c3632753162f7d2655f854971ae5';
  String openWeatherUrl = 'https://api.openweathermap.org/data/3.0/onecall';

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        Uri.parse('$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric'));
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    String apiKey = '2400c3632753162f7d2655f854971ae5';
    String openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'));
    try {
      var weatherData = await networkHelper.getData();
      return weatherData;
    } catch (error) {
      print(error);
      return null;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'images/little_rain.png';
    } else if (condition < 400) {
      return 'images/potential_cloud.png';
    } else if (condition < 600) {
      return 'images/rain_drops.png';
    } else if (condition < 700) {
      return 'images/mid.png';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition == 800) {
      return 'images/little_rain.png';
    } else if (condition <= 804) {
      return 'images/potential_cloud.png';
    } else {
      return '🤷';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It"s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return "You'll need 🧣 and 🧤 ";
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

class Weather {
  final String cityName;
  final double temperature;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final temperature = json['main']['temp'].toDouble();
    final description = json['weather'][0]['description'];

    return Weather(
      cityName: cityName,
      temperature: temperature,
      description: description,
    );
  }
}
