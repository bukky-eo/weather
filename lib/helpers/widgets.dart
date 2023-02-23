import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'constants.dart';

class LocationCard extends StatefulWidget {
  final locationWeather;
  const LocationCard({Key? key, this.locationWeather}) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  String? weatherMessage;
  String? cityName;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get Weather Data';
      cityName = '';
      return;
    }
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage = weather.getMessage(temperature);
    cityName = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: kBlack, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String imageUrl;
  final String info;
  const WeatherCard({Key? key, required this.imageUrl, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 10),
      decoration:
          BoxDecoration(color: kBlack, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 5),
          Text(
            info,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class WeatherCardInfo extends StatelessWidget {
  final String imageUrl;
  final String info;
  final String time;
  const WeatherCardInfo(
      {Key? key,
      required this.imageUrl,
      required this.info,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      decoration:
          BoxDecoration(color: kBlack, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            info,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.asset(imageUrl),
          Text(
            time,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PotentialInfo extends StatelessWidget {
  final String celsius;
  final String day;
  final String date;
  final String imageUrl;
  const PotentialInfo(
      {Key? key,
      required this.celsius,
      required this.day,
      required this.date,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // '27°',
          celsius,
          style: const TextStyle(
              color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700),
        ),
        Column(
          children: [
            Text(
              day,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              date,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Image.asset(imageUrl)
      ],
    );
  }
}
