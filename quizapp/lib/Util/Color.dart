import 'dart:convert';

import 'package:flutter/material.dart';
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
