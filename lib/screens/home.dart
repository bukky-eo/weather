import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers/constants.dart';
import 'package:weather_app/helpers/widgets.dart';

// import '../helpers/widgets.dart';
import '../services/weather.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: CupertinoPageScaffold(
          backgroundColor: kBackground,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 5),
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
                        CupertinoIcons.chevron_back,
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
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: kSearch, borderRadius: BorderRadius.circular(10)),
                  child: CupertinoTextField(
                    cursorColor: kBlack,
                    placeholder: 'Search...',
                    decoration: const BoxDecoration(color: kSearch),
                    prefix: const Icon(
                      CupertinoIcons.search,
                      color: kIconSearch,
                    ),
                    suffix: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: kBlack,
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset(
                        'images/shuffle.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Next week',
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
                ),
                const SizedBox(height: 15),
                Container(
                  height: screenHeight / 2,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: kBlack, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: const [
                      Text(
                        'Potential Weather',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5),
                      PotentialInfo(
                          celsius: '27°',
                          day: 'Monday',
                          date: '15 May 2022',
                          imageUrl: 'images/potential_cloud.png'),
                      Divider(
                        height: 5,
                        color: kDivide,
                      ),
                      PotentialInfo(
                          celsius: '22°',
                          day: 'Tuesday',
                          date: '16 May 2022',
                          imageUrl: 'images/potential_zap.png'),
                      Divider(
                        height: 15,
                        color: kDivide,
                      ),
                      PotentialInfo(
                          celsius: '19°',
                          day: 'Wednesday',
                          date: '17 May 2022',
                          imageUrl: 'images/potential_rain.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
