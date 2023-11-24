import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    MainCategory(),
    const Brodcast(),
    const LeaderBoard(),
    const Profile(),
    const Liberary(),
  ];
  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: GNav(
        iconSize: 30,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
        activeColor: Theme.of(context).colorScheme.primary,
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          GButton(
            icon: Icons.person,
            text: "Home",
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          GButton(
            icon: Icons.person,
            text: "Home",
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          GButton(
            icon: Icons.person,
            text: "Home",
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });
            },
          ),
          GButton(
            icon: Icons.person,
            text: "Home",
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
