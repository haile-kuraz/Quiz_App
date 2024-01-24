import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Util/Constants.dart';
import '../Models/ScoreModle.dart';
import 'package:http/http.dart' as http;

class score_controller {
  static Future<ScoreModel> featchingScore(int id) async {
    try {
      final response = await http.get(Uri.parse("$mainApi/scores/$id"));

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        var jsonResponse = response.body;
        ScoreModel res = ScoreModel.fromJson(json.decode(jsonResponse));
        return res;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception(
            'Failed to load data with status code offff : ${response.statusCode}');
      }
    } catch (error) {
      throw Future.error(error);
    }
  }

  static Future UpdatingBroadcastScore(int id, double result) async {
    try {
      final response = await http.put(
        Uri.parse("$mainApi/scores/$id/UpdateBroadcastScore"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "student_id": id,
          "broadcast_score": result,
        }),
      );
      if (response.statusCode == 200) {
        messageflutterToast("The result has been registered");
        return response.body;
      } else {
        messageflutterToast(
            " Error with status code of : ${response.statusCode}");
      }
    } catch (error) {
      messageflutterToast("We have got and error $error");
      throw Future.error(error);
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
