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

  Future<dynamic> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );
    
    final data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return data["message"];
    }
  }

  Future<dynamic> login(String email, String password) async {
    final preferences = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse("$_baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    
    final data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await preferences.setString(tokenKey, data["loginResult"]["token"]);
      await preferences.setBool(stateKey, true);
      return true;
    } else {
      return data["message"];
    }
  }

  Future<bool> logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(tokenKey, "");
    return preferences.setBool(stateKey, false);
  }
}
