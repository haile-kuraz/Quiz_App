import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/StudentScoreModel.dart';
import '../Util/Constants.dart';

class student_controller {
  static Future signUp(String name, String email, String phone, String password,
      String imgUrl) async {
    try {
      final response = await http.post(
        Uri.parse('$mainApi/students/Addnew'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'Name': name,
          'Email': email,
          'password': password,
          'phone_number': phone,
          'Image_url': imgUrl,
        }),
      );
      if (response.statusCode == 200) {
        messageflutterToast("Registration success");

        return jsonDecode(response.body);
      } else if (response.statusCode == 409) {
        messageflutterToast("The user already exists");
      } else if (response.statusCode == 422) {
        messageflutterToast("please check Inputs");
      } else {
        messageflutterToast("server error ${response.statusCode}");

        return Future.error("Server Error");
      }
    } catch (error) {
      print("connection error $error");
    }
  }

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
      messageflutterToast("Connection Problem");
      return Future.error(error);
    }
  }

  static Future updateProfile(int studentId, String name, String email,
      String password, String phone, String imgUrl) async {
    try {
      final response = await http.put(
        Uri.parse('$mainApi/students/$studentId/Update'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'Name': name,
          'Email': email,
          'password': password,
          'phone_number': phone,
          'Image_url': imgUrl,
        }),
      );
      if (response.statusCode == 200) {
        messageflutterToast("Updated Successfully");

        return jsonDecode(response.body);
      } else {
        messageflutterToast("sever error ${response.statusCode}");
      }
    } catch (error) {
      print("connection error $error");
      messageflutterToast("Connection Problem : $error");
      return Future.error(error);
    }
  }

  static Future getTopTenStudentsByRank() async {
    try {
      final response =
          await http.get(Uri.parse("$mainApi/stdents/getTopTenStudentsByRank"));

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        StudentScoreModel res =
            StudentScoreModel.fromJson(json.decode(response.body));
        return res;
      } else {
        throw Exception('Failed to load data  ${response.statusCode}');
      }
    } catch (e) {
      Future.error(e);
      return Future.error(e);
    }
  }

  static Future<StudentScoreModel> getAllStudentsByRank() async {
    try {
      final response =
          await http.get(Uri.parse("$mainApi/stdents/getAllStudentsByPoint"));

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        StudentScoreModel res =
            StudentScoreModel.fromJson(json.decode(response.body));
        return res;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.

        throw Exception('Failed to load data ${response.statusCode}');
      }
    } catch (e) {
      Future.error(e);
      return Future.error(e);
    }
  }
}

// stdents/getAllStudentsByRank

void messageflutterToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
