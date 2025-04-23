import 'package:flutter/material.dart';
import 'package:story_app/data/api/api_auth.dart';

class AuthProvider extends ChangeNotifier {
  final ApiAuth apiAuth;

  AuthProvider(this.apiAuth);

  bool isLoadingLogin = false;
  bool isLoadingLogout = false;
  bool isLoadingRegister = false;
  bool isLoggedIn = false;

  Future<bool> login(String email, String password) async {
    isLoadingLogin = true;
    notifyListeners();
    await apiAuth.login(email, password);
    isLoggedIn = await apiAuth.isLoggedIn();
    isLoadingLogin = false;
    notifyListeners();
    return isLoggedIn;
  }

  Future<bool> register(String name, String email, String password) async {
    isLoadingRegister = true;
    notifyListeners();
    final userState = await apiAuth.register(name, email, password);
    isLoadingRegister = false;
    notifyListeners();
    return userState;
  }
}
