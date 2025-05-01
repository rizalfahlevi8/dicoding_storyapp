import 'package:flutter/material.dart';
import 'package:story_app/data/api/api_auth.dart';

class AuthProvider extends ChangeNotifier {
  final ApiAuth apiAuth;

  AuthProvider(this.apiAuth);

  bool isLoadingLogin = false;
  bool isLoadingLogout = false;
  bool isLoadingRegister = false;
  bool isLoggedIn = false;

  Future<dynamic> login(String email, String password) async {
    isLoadingLogin = true;
    notifyListeners();
    try {
      final result = await apiAuth.login(email, password);
      isLoadingLogin = false;
      notifyListeners();
      return result;
    } catch (e) {
      isLoadingLogin = false;
      notifyListeners();
      return "Something went wrong.";
    }
  }

  Future<dynamic> register(String name, String email, String password) async {
    isLoadingRegister = true;
    notifyListeners();
    try {
      final result = await apiAuth.register(name, email, password);
      isLoadingRegister = false;
      notifyListeners();
      return result;
    } catch (e) {
      isLoadingRegister = false;
      notifyListeners();
      return "Something went wrong.";
    }
  }

  Future<bool> logout() async {
    isLoadingLogout = true;
    notifyListeners();
    try {
      final logout = await apiAuth.logout();
      isLoadingLogout = false;
      notifyListeners();
      return logout;
    } catch (e) {
      isLoadingLogout = false;
      notifyListeners();
      return false;
    }
  }
}
