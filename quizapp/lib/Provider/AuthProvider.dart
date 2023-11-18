import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCancled,
}

class AuthProvider extends ChangeNotifier {
  Status _status = Status.uninitialized;
}
