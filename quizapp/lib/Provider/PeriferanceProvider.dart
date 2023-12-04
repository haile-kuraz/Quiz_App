import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Periferance extends ChangeNotifier {
  Periferance({required this.prefs}) {
    _initializeSettings();
  }
  final SharedPreferences prefs;
  static bool? isthereSound;
  static bool? isDark = false;
  static bool? isOnboardingShowing;

  Future<void> _initializeSettings() async {
    isDark = prefs.getBool('DARK_THEME') ?? false;
    isOnboardingShowing = prefs.getBool('ON_BOARDING') ?? true;
    isthereSound = prefs.getBool('SOUND') ?? true;
    notifyListeners();
  }

  Future<void> setOnboardingStatus(bool value) async {
    await prefs.setBool('ON_BOARDING', value);
    notifyListeners();
  }

  Future<void> setIsDarkStatus(bool value) async {
    await prefs.setBool('DARK_THEME', value);
    notifyListeners();
  }

  Future<void> setIsthereSound(bool value) async {
    await prefs.setBool('SOUND', value);
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
}
