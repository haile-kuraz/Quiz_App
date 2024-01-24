import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Util/Constants.dart';

class CategoryPoint_controller {
  static Future AddingPoint(int studentId, int categoryId, int point) async {
    try {
      final response = await http.put(
        Uri.parse('$mainApi/points/$studentId/$categoryId/UpdatePoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "point": point,
        }),
      );
      if (response.statusCode == 200) {
        messageflutterToast("Point has been added successfully");
        return jsonDecode(response.body);
      } else {
        messageflutterToast("Server error ${response.statusCode}");
        return Future.error("Server Error");
      }
    } catch (error) {
      print("Connection error $error");
    }
  }
}

void messageflutterToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
