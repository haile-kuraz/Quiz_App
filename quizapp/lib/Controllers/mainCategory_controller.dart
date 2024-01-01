import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../Models/MainCategryModel.dart';
import '../Util/Constants.dart';

class mainCategory_controller {
  static Future showAllMainCategories() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    String fileName = "AllmainCategories.json";

    var dir = await getTemporaryDirectory();

    File file = File("${dir.path}/$fileName");
    if (file.existsSync()) {
      print("Loading from cache");

      try {
        var jsonData = await file.readAsString();
        MainCategoryModel response =
            MainCategoryModel.fromJson(json.decode(jsonData));

        return response;
      } catch (error) {
        print("Error reading from file: $error");
        // Handle the error, possibly return a default value or rethrow the error.
        return Future.error(error);
      }
    } else {
      print("Loading from API");
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        var response = await http.get(
          Uri.parse('$mainApi/categories/Showall'),
        );

        if (response.statusCode == 200) {
          var jsonResponse = response.body;
          MainCategoryModel res =
              MainCategoryModel.fromJson(json.decode(jsonResponse));
          // Save json in local file
          try {
            await file.writeAsString(jsonResponse,
                flush: true, mode: FileMode.write);
          } catch (error) {
            print("Error writing to file: $error");
            // Handle the error, possibly return a default value or rethrow the error.
            return Future.error(error);
          }

          return res;
        } else {
          print("API request failed with status code: ${response.statusCode}");
          // Handle the error, possibly return a default value or rethrow the error.
          return Future.error(
              "API request failed with status code: ${response.statusCode}");
        }
      } else {
        return messageflutterToast("Connection Problem");
      }
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
