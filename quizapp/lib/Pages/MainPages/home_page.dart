import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'brodcast_page.dart';
import 'leaderboard_page.dart';
import 'library_page.dart';
import 'mainCategories_page.dart';
import 'profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex;
  final List<Widget> _screens = [
    const MainCategory(),
    const Brodcast(),
    const LeaderBoard(),
    const Liberary(),
    const Profile(),
  ];
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: GNav(
        gap: 5,
        // iconSize: 30,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
        activeColor: Theme.of(context).colorScheme.primary,
        tabs: [
          GButton(
            icon: FontAwesomeIcons.house,
            text: "Home",
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          GButton(
            icon: FontAwesomeIcons.medal,
            text: "Match",
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          GButton(
            icon: FontAwesomeIcons.rankingStar,
            text: "Leaders",
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          GButton(
            icon: FontAwesomeIcons.bookOpenReader,
            text: "Liberary",
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });
            },
          ),
          GButton(
            icon: FontAwesomeIcons.userGear,
            text: "Profile",
            onPressed: () {
              setState(() {
                _currentIndex = 4;
              });
            },
          ),
        ],
      ),
    );
  }
}
