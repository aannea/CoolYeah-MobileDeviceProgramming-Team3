import 'package:flutter/material.dart';
import 'package:littlegrowth/main_navigator.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'package:littlegrowth/view/login.dart';
import 'package:littlegrowth/view/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
