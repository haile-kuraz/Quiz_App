import 'dart:convert';
import '../Util/Constants.dart';
import '../Models/ScoreModle.dart';
import 'package:http/http.dart' as http;

class score_controller {
  static Future<ScoreModel> featchingScore(int id) async {
    try {
      final response = await http.get(Uri.parse("${mainApi}/scores/$id"));

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        var jsonResponse = response.body;
        ScoreModel res = ScoreModel.fromJson(json.decode(jsonResponse));
        return res;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Future.error(error);
    }
  }
}
