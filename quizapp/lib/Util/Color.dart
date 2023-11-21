import 'dart:convert';

import 'package:flutter/services.dart';

class colors {
  static Future<Map<String, dynamic>> readJson(String name) async {
    final String response = await rootBundle.loadString('Assets/tokens/$name');
    final Map<String, dynamic> data = await json.decode(response);
    return data["md"];
  }

  static Future<Map<String, dynamic>> getLightData() async {
    return await readJson('LightTheme.json');
  }

  static Future<Map<String, dynamic>> getDarkData() async {
    return await readJson('DarkTheme.json');
  }
}
// ___________________________________Light_sys_Colors_____________________________

const Color primary_Light = Color(0xffB7A355);
const Color onPrimary_Light = Color(0xff998537);
const Color primaryContainer_Light = Color(0xffE9D587);
const Color secondary_Light = Color(0xffFFFFEB);
const Color onSecondary_Light = Color(0xffFFFFFF);
const Color secondarycontainer_Light = Color(0xffFFFFFF);
const Color onSecondaryContainer_Light = Color(0xffFFF3CD);
const Color tertiary_Light = Color(0xff6E5B37);
const Color onTertiary_Light = Color(0xffFFFFFF);
const Color tertiaryContainer_Light = Color(0xffA08D69);
const Color onTertiaryContainer_Light = Color(0xff503D19);
const Color error_Light = Color(0xffFF8D75);
const Color onError_Light = Color(0xffFFFFFF);
const Color errorContainer_Light = Color(0xffFFBFA7);
const Color onErrorContainer_Light = Color(0xffED6F57);
const Color background_Light = Color(0xffFFFFFF);
const Color onBackground_Light = Color(0xffE0DEDE);
const Color surface_Light = Color(0xffFFFBFE);
const Color onSurface_Light = Color(0xffE0DEDE);

// ___________________________________Dark_sys_Colors_____________________________

const Color primary_Dark = Color(0xffFFFFD2);
const Color onPrimary_Dark = Color(0xffFFEC96);
const Color primaryContainer_Dark = Color(0xffFFF6A0);
const Color onPrimaryContainer_Dark = Color(0xffFFFFDC);
const Color secondary_Dark = Color(0xffCFCFCF);
const Color onSecondary_Dark = Color(0xff939393);
const Color secondarycontainer_Dark = Color(0xff9D9D9D);
const Color onSecondaryContainer_Dark = Color(0xffD9D9D9);
const Color tertiary_Dark = Color(0xffFFFFFF);
const Color onTertiary_Dark = Color(0xffEAE8E8);
const Color tertiaryContainer_Dark = Color(0xffF4F2F2);
const Color onTertiaryContainer_Dark = Color(0xffFFFFFF);
const Color error_Dark = Color(0xffFFB59D);
const Color onError_Dark = Color(0xffF77961);
const Color errorContainer_Dark = Color(0xffFF836B);
const Color onErrorContainer_Dark = Color(0xffFFBFA7);
const Color background_Dark = Color(0xff1A1A1A);
const Color onBackground_Dark = Color(0xff6A6A6A);
const Color surface_Dark = Color(0xff1A1A1A);
const Color onSurface_Dark = Color(0xff6A6A6A);
