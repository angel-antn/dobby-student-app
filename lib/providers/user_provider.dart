import 'package:flutter/material.dart';
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/models/user_response.dart';

class UserProvider extends ChangeNotifier {
  User? _user = Preferences.user;

  clear() {
    _user = null;
  }

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  User? get user {
    return _user;
  }
}
