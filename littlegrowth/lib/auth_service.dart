import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/models/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserModel? _currentUser;
  SharedPreferences? _prefs;

  UserModel? get currentUser => _currentUser;

  AuthService() {
    _initPrefs();
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadCurrentUserFromPrefs();
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _loadCurrentUser(userCredential.user);
      await _saveUserToPrefs(_currentUser!);
    } catch (e) {
      _currentUser = null;
      notifyListeners();
      rethrow; // Using rethrow to preserve the stack trace
    }
  }

  Future<void> register(String email, String password, String role) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'id': userCredential.user?.uid.toString(),
        'email': email,
        'role': role,
      });
      await _loadCurrentUser(userCredential.user);
    } catch (e) {
      _currentUser = null;
      notifyListeners();
      rethrow; // Using rethrow to preserve the stack trace
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _currentUser = null;
    await _clearPrefs();
    notifyListeners();
  }

  void _onAuthStateChanged(User? firebaseUser) {
    if (firebaseUser == null) {
      _currentUser = null;
      notifyListeners();
    } else {
      _loadCurrentUser(firebaseUser);
    }
  }

  Future<void> _loadCurrentUser(User? firebaseUser) async {
    if (firebaseUser != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(firebaseUser.uid).get();
      if (userDoc.exists) {
        _currentUser =
            UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        await _saveUserToPrefs(_currentUser!);
      } else {
        _currentUser = null;
      }
    } else {
      _currentUser = null;
    }
    notifyListeners();
  }

  Future<void> _saveUserToPrefs(UserModel user) async {
    if (_prefs != null) {
      await _prefs!.setString('user_id', user.id);
      await _prefs!.setString('user_role', user.role);
      await _prefs!.setString('user_email', user.email);
    }
  }

  Future<void> _loadCurrentUserFromPrefs() async {
    if (_prefs != null) {
      String? userId = _prefs!.getString('user_id');
      String? userRole = _prefs!.getString('user_role');
      String? userEmail = _prefs!.getString('user_email');

      if (userId != null && userRole != null && userEmail != null) {
        _currentUser = UserModel(id: userId, role: userRole, email: userEmail);
      }
      notifyListeners();
    }
  }

  Future<void> _clearPrefs() async {
    if (_prefs != null) {
      await _prefs!.remove('user_id');
      await _prefs!.remove('user_role');
      await _prefs!.remove('user_email');
    }
  }

  Future<String?> getUserIdFromPrefs() async {
    String? userId = _prefs!.getString('user_id');
    return userId;
  }
}
