import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../Util/Constants.dart';

class student_controller {
  static Future login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$mainApi/students/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 201) {
        messageflutterToast("LogedIn");

        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        messageflutterToast("Incorrect email or password");
      } else {
        messageflutterToast("sever error ${response.statusCode}");

        return Future.error("Server Error");
      }
    } catch (error) {
      print("connection error $error");
      return Future.error(error);
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
