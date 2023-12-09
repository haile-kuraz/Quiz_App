import 'dart:convert';
import '../Util/Constants.dart';

import 'package:http/http.dart' as http;

class score_controller {
  Future<String> fetchData() async {
    final response = await http.get(Uri.parse("${mainApi}/"));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
