import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers/constants.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/locations.dart';
import 'package:weather_app/screens/profile.dart';
import 'package:weather_app/screens/syncs.dart';
import 'package:weather_app/services/locations.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Location location = Location();
  // String cityName = await Location().getCityNameFromLocation();
  int selectedIndex = 0;

  void navBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    Home(),
    Locations(
      city: '',
    ),
    Syncs(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: kDarkGrey,
        inactiveColor: kGrey,
        currentIndex: selectedIndex,
        iconSize: 26,
        onTap: navBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.house_fill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.compass_fill,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.arrow_right_arrow_left_square_fill,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_fill,
              ),
              label: ''),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
