import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String emailOrMobile, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (emailOrMobile.isNotEmpty && password.isNotEmpty) {
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = "Please enter valid credentials";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}