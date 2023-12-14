import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Periferance extends ChangeNotifier {
  Periferance({required this.prefs}) {
    _initializeSettings();
  }
  final SharedPreferences prefs;
  static bool? isthereSound;
  static bool? isDark;
  static bool? isOnboardingShowing;
  static bool? isTimershowing;
  static String? name;
  static String? image;

  Future<void> _initializeSettings() async {
    isDark = prefs.getBool('DARK_THEME') ?? false;
    isOnboardingShowing = prefs.getBool('ON_BOARDING') ?? true;
    isthereSound = prefs.getBool('SOUND') ?? true;
    isTimershowing = prefs.getBool('TIMER') ?? true;
    name = prefs.getString('NAME') ?? "Unknown";
    image = prefs.getString('IMAGE') ?? "Unknown";
    notifyListeners();
  }

  Future<void> setOnboardingStatus(bool value) async {
    await prefs.setBool('ON_BOARDING', value);
    notifyListeners();
  }

  Future<void> setIsDarkStatus(bool value) async {
    await prefs.setBool('DARK_THEME', value);
    isDark = value;
    notifyListeners();
  }

  Future<void> setIsthereSound(bool value) async {
    await prefs.setBool('SOUND', value);
    isthereSound = value;
    notifyListeners();
  }

  Future<void> setisTimershowing(bool value) async {
    await prefs.setBool('TIMER', value);
    isTimershowing = value;
    notifyListeners();
  }

  Future<void> setName(String value) async {
    await prefs.setString('NAME', value);
    name = value;
    notifyListeners();
  }

  Future<void> setProfilImage(String value) async {
    await prefs.setString('IMAGE', value);
    image = value;
    notifyListeners();
  }

  bool? getIsDark() {
    return isDark;
  }

  bool? getIsOnboardingShowing() {
    return isOnboardingShowing;
  }

  bool? getIsthereSound() {
    return isthereSound;
  }

  bool? getisTimershowing() {
    return isTimershowing;
  }

  String? getName() {
    return name;
  }

  String? getImage() {
    return image;
  }
}
