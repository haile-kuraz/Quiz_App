import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../Util/Constants.dart';
import '../Models/NormalQuestionsModle.dart';

class normalQuesion_controller {
  static Future<QuestionModel> getAllQuestions() async {
    String fileName = "ALLQuestions.json";

    var dir = await getTemporaryDirectory();

    File file = File("${dir.path}/$fileName");
    if (file.existsSync()) {
      print("Loading from cache");

      try {
        var jsonData = await file.readAsString();
        QuestionModel response = QuestionModel.fromJson(json.decode(jsonData));

        return response;
      } catch (error) {
        print("Error reading from file: $error");
        // Handle the error, possibly return a default value or rethrow the error.
        return Future.error(error);
      }
    } else {
      print("Loading from API");
      try {
        var response = await http.get(
          Uri.parse('$mainApi/normalQuestions/getAllQuestionsWithTheirOptions'),
        );

        if (response.statusCode == 200) {
          var jsonResponse = response.body;
          QuestionModel res = QuestionModel.fromJson(json.decode(jsonResponse));
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
      } catch (error) {
        print("Connection error: $error");
        // Handle the error, possibly return a default value or rethrow the error.
        return Future.error(error);
      }
    }
  }
}
