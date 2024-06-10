import 'package:flutter/material.dart';
import 'user_model.dart';

class AuthService extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void login(String username, String password) {
    if (username == 'admin' && password == '123') {
      _currentUser = User(id: '1', role: 'admin');
    } else if (username == 'user' && password == '123') {
      _currentUser = User(id: '2', role: 'user');
    } else {
      _currentUser = null;
    }
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
