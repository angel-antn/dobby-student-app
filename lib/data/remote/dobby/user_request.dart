import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/models/user_response.dart';

class UserRequest {
  final String _baseUrl = dotenv.env['HOST_API'] ?? '';
  final String _path = '/api/users';

  Future<UserResponse?> login(
      {required String email, required String password}) async {
    final url = Uri.http(_baseUrl, '$_path/login');

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserResponse.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<UserResponse?> register({
    required String name,
    required String lastname,
    required String email,
    required String password,
  }) async {
    final url = Uri.http(_baseUrl, '$_path/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'name': name,
          'lastname': lastname,
          'email': email,
          'password': password
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserResponse.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<User?> edit({
    required String name,
    required String lastname,
  }) async {
    final url = Uri.http(_baseUrl, '$_path/${Preferences.user?.id}');

    final response = await http.patch(
      url,
      body: json.encode(
        {
          'name': name,
          'lastname': lastname,
        },
      ),
      headers: {
        'Authorization': Preferences.token ?? '',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<UserResponse?> me() async {
    final url = Uri.http(_baseUrl, '$_path/me');

    final response = await http
        .get(url, headers: {'Authorization': Preferences.token ?? ''});

    if (response.statusCode == 200) {
      return UserResponse.fromJson(response.body);
    } else {
      return null;
    }
  }
}
