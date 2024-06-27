import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/models/result_response.dart';
import 'package:student_app/models/stats_response.dart';

class ResultRequest {
  final String _baseUrl = dotenv.env['HOST_API'] ?? '';
  final String _path = '/api/results';

  Future<bool> createResult(
      {required String userId,
      required String details,
      required String level,
      required int questionsCount,
      required int questionsQty}) async {
    final url = Uri.http(_baseUrl, _path);

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "userId": userId,
          "details": details,
          "questionsCount": questionsCount,
          "questionsQty": questionsQty,
          "level": level
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<StatsResponse?> getStats({required String userId}) async {
    final url = Uri.http(_baseUrl, '$_path/$userId/stats');

    final response = await http
        .get(url, headers: {'Authorization': Preferences.token ?? ''});

    if (response.statusCode == 200) {
      return StatsResponse.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<ResultResponse?> getResult({required String userId}) async {
    final url = Uri.http(_baseUrl, '$_path/$userId');

    final response = await http
        .get(url, headers: {'Authorization': Preferences.token ?? ''});

    if (response.statusCode == 200) {
      return ResultResponse.fromJson(response.body);
    } else {
      return null;
    }
  }
}
