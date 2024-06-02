// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/auth_service.dart';
import 'package:littlegrowth/view/pendidik/navigator.dart';
import 'package:littlegrowth/view/waliMurid/navigator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (user.role == 'admin') {
      return MainPendidikNavigator();
    } else {
      return MainMuridNavigator();
    }
  }
}