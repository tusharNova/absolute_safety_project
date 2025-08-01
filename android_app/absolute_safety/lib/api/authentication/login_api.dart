import 'dart:convert';

import 'package:absolute_safety/api/app_link.dart';
import 'package:absolute_safety/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<String> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(AppLink.login),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        List<LoginModel> loginModels = jsonDecode(response.body);
        return loginModels.first.role;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
