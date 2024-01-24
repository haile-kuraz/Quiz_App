import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllPopUps {
  static void messageflutterToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
