import 'package:flutter/material.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCancled,
}

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  final Status _status = Status.uninitialized;
}
