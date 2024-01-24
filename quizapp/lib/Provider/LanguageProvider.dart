import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');
  BuildContext? _currentcontext;

  Locale get currentLocale => _currentLocale;
  BuildContext? getcurrentcontext() {
    return _currentcontext;
  }

  void changeLanguage(Locale newLocale, BuildContext context) {
    if (_currentLocale != newLocale) {
      _currentLocale = newLocale;
      EasyLocalization.of(context)?.setLocale(newLocale);
      _currentcontext = context;
      notifyListeners();
    }
  }
}
