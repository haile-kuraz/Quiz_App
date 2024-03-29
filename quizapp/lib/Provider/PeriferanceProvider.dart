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
  static String? email;
  static String? phonenumber;
  static int? studentId;
  static String? quizStartingTime;
  static bool? isQuizLive;
  static bool? isQuizAvalilableToday;
  static bool? dowefinishedQuiz;
  static String? difficulty;
  static int? broadcastQuestionNumber;
  Future<void> _initializeSettings() async {
    isDark = prefs.getBool('DARK_THEME') ?? false;
    isOnboardingShowing = prefs.getBool('ON_BOARDING') ?? true;
    isthereSound = prefs.getBool('SOUND') ?? true;
    isTimershowing = prefs.getBool('TIMER') ?? true;
    name = prefs.getString('NAME') ?? "Unknown";
    image = prefs.getString('IMAGE') ?? "Unknown";
    phonenumber = prefs.getString('PHONE') ?? "Unknown";
    email = prefs.getString('EMAIL') ?? "Unknown";
    studentId = prefs.getInt('STUDENTID') ?? 0;
    quizStartingTime = prefs.getString('QUIZSTARTINGTIME');
    isQuizLive = prefs.getBool('ISQUIZLIVE') ?? false;
    dowefinishedQuiz = prefs.getBool('DOWEFINISHED') ?? false;
    isQuizAvalilableToday = prefs.getBool("isQuizAvalilableToday") ?? false;
    difficulty = prefs.getString('DIFFICULTY') ?? "easy";
    broadcastQuestionNumber = prefs.getInt('BroadcastQuestionNo') ?? 0;

    notifyListeners();
  }

  Future<void> setdowefinishedQuiz(bool value) async {
    await prefs.setBool('DOWEFINISHED', value);
    dowefinishedQuiz = value;
    notifyListeners();
  }

  Future<void> setbroadcastQuestionNumber(int value) async {
    await prefs.setInt('BroadcastQuestionNo', value);
    broadcastQuestionNumber = value;
    notifyListeners();
  }

  Future<void> setdifficulty(String value) async {
    await prefs.setString('DIFFICULTY', value);
    difficulty = value;
    notifyListeners();
  }

  Future<void> setisQuizAvalilableToday(bool value) async {
    await prefs.setBool('isQuizAvalilableToday', value);
    isQuizAvalilableToday = value;
    notifyListeners();
  }

  Future<void> setIsQuizLive(bool value) async {
    await prefs.setBool('ISQUIZLIVE', value);
    isQuizLive = value;
    notifyListeners();
  }

  Future<void> setQuizStartingTime(String value) async {
    await prefs.setString('QUIZSTARTINGTIME', value);
    quizStartingTime = value;
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

  Future<void> setEmail(String value) async {
    await prefs.setString('EMAIL', value);
    email = value;
    notifyListeners();
  }

  Future<void> setPhone(String value) async {
    await prefs.setString('PHONE', value);
    phonenumber = value;
    notifyListeners();
  }

  Future<void> setProfilImage(String value) async {
    await prefs.setString('IMAGE', value);
    image = value;
    notifyListeners();
  }

  Future<void> setStudentId(int value) async {
    await prefs.setInt('STUDENTID', value);
    studentId = value;
    notifyListeners();
  }

  Future<void> resetSharedPreferences(
    String name,
    String email,
    String phone,
    String image,
  ) async {
    await prefs.remove('NAME');
    await prefs.remove('EMAIL');
    await prefs.remove('PHONE');
    await prefs.remove('IMAGE');

    await setName(name);
    await setEmail(email);
    await setPhone(phone);
    await setProfilImage(image);

    notifyListeners();
  }

  bool? getdowefinishedQuiz() {
    return dowefinishedQuiz;
  }

  bool? getisQuizAvalilableToday() {
    return isQuizAvalilableToday;
  }

  int? getbroadcastQuestionNumber() {
    return broadcastQuestionNumber;
  }

  String? getdifficulty() {
    return difficulty;
  }

  bool? getIsQuizLive() {
    return isQuizLive;
  }

  String? getQuizStartingTime() {
    return quizStartingTime;
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

  String? getEmail() {
    return email;
  }

  String? getphone() {
    return phonenumber;
  }

  String? getImage() {
    return image;
  }

  int? getStudentId() {
    return studentId;
  }
}
