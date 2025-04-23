import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiAuth {
  static const String _baseUrl = "https://story-api.dicoding.dev/v1";
  final String stateKey = "state";
  final String tokenKey = "token";

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(stateKey) ?? false;
  }

  Future<bool> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/register"),
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception("Failed to create register");
    }
  }

  Future<bool> login(String email, String password) async {
    final preferences = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse("$_baseUrl/login"),
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await preferences.setString(tokenKey, data["token"]);

      return preferences.setBool(stateKey, true);
    } else {
      throw Exception("Failed login");
    }
  }

  Future<bool> logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(tokenKey, "");
    return preferences.setBool(stateKey, false);
  }
}
