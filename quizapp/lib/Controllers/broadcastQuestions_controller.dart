import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/BroadcastQuestionsModel.dart';
import '../Util/Constants.dart';

class BroadcastQuestion_controller {
  static Future<BroadcastQuestionsModel> gettingAllQuestions() async {
    try {
      final response = await http.get(Uri.parse(
          "${mainApi}/broadCastQuestions/getAllQuestionsWithTheirOptions"));
      var jsonResponse = json.decode(response.body);

      // Fetch data using your score_controller

      if (response.statusCode == 200) {
        // If status code is 200, proceed with parsing and updating the stream
        BroadcastQuestionsModel broadcastQuestions =
            BroadcastQuestionsModel.fromJson(jsonResponse);
        return broadcastQuestions;
      } else {
        // Handle other status codes
        throw Future.error("Error in broadcastControl: ${response.statusCode}");
      }
    } catch (error) {
      // Handle other errors
      throw ("faild to load: ${error}");
    }
  }
}
