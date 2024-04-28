import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:student_app/app.dart';
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/data/remote/dobby/user_request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    dotenv.load(fileName: ".env"),
    Preferences.init(),
  ]);

  if (Preferences.user != null) {
    final userRequest = UserRequest();
    final userResponse = await userRequest.me();
    if (userResponse != null) {
      Preferences.user = userResponse.user;
      Preferences.token = userResponse.token;
    }
  }

  runApp(const AppProviderTree());
}
