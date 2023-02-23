import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../helpers/constants.dart';
import '../helpers/widgets.dart';
import '../services/weather.dart';

class Locations extends StatefulWidget {
  final String city;
  const Locations({required this.city});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  WeatherModel weatherModel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMMd().add_jm().format(now);
    return SafeArea(
      child: SingleChildScrollView(
        child: CupertinoPageScaffold(
          backgroundColor: kBackground,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: kBorder, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(9)),
                      child: const Icon(
                        CupertinoIcons.slider_horizontal_3,
                        color: kBlack,
                        size: 32,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: kBorder, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(9)),
                      child: const Icon(
                        CupertinoIcons.bell,
                        color: kBlack,
                        size: 32,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Stack(children: [
                  FutureBuilder(
                      future: weatherModel.getLocationWeather(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          var weatherData = snapshot.data;
                          int condition = weatherData['weather'][0]['id'];
                          String cityName = weatherData['name'];
                          double temperature = weatherData['main']['temp'];
                          String weatherIcon =
                              weatherModel.getWeatherIcon(condition);
                          String message =
                              weatherModel.getMessage(temperature.toInt());
                          return Container(
                            height: screenHeight / 4,
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: kBlack,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                      fontSize: 19, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cityName,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              return const LinearGradient(
                                                colors: [
                                                  Colors.white,
                                                  Colors.white,
                                                  Colors.white10
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                tileMode: TileMode.mirror,
                                              ).createShader(bounds);
                                            },
                                            child: RichText(
                                              text: TextSpan(
                                                text: temperature
                                                    .toStringAsFixed(1),
                                                style: const TextStyle(
                                                    fontSize: 64),
                                                children: [
                                                  WidgetSpan(
                                                    child: Transform.translate(
                                                      offset: const Offset(
                                                          0, -45.0),
                                                      child: const Text(
                                                        '°C',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            message,
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      // Image.asset('images/cloud.png'),
                                    ])
                              ],
                            ),
                          );
                        } else {
                          return Text('No data available');
                        }
                      }),
                  Positioned(
                      bottom: -10,
                      right: 0,
                      child: Image.asset('images/cloud.png'))
                ]),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 21,
                          color: kDarkGrey,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: const [
                        Text(
                          'Next 14 Days',
                          // textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 13,
                              color: kDarkGrey,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.navigate_next_outlined,
                          color: kDarkGrey,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    WeatherCard(
                        imageUrl: 'images/little_rain.png',
                        info: 'Sunny rainy'),
                    WeatherCard(imageUrl: 'images/zaps.png', info: 'Thunder'),
                    WeatherCard(imageUrl: 'images/mid.png', info: 'Wind')
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Temperature',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 21,
                      color: kDarkGrey,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    WeatherCardInfo(
                        imageUrl: 'images/rain_small.png',
                        info: '18°C',
                        time: '06:00'),
                    WeatherCardInfo(
                        imageUrl: 'images/zap_small.png',
                        info: '20°C',
                        time: '09:00'),
                    WeatherCardInfo(
                        imageUrl: 'images/rain_drops.png',
                        info: '23°C',
                        time: '12:00'),
                    WeatherCardInfo(
                        imageUrl: 'images/rain_small.png',
                        info: '25°C',
                        time: '15:00'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
