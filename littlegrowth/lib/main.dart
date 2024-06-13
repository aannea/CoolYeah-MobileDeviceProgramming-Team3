// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/auth_service.dart';
import 'package:littlegrowth/firebase_options.dart';
import 'package:littlegrowth/main_navigator.dart';
import 'package:littlegrowth/view/pendidik/services/anaks_service.dart';
import 'package:littlegrowth/view/pendidik/services/laporan_akademiks_anak_service.dart';
import 'package:littlegrowth/view/pendidik/services/laporan_fisiks_anak_service.dart';
import 'package:littlegrowth/view/pendidik/tambah_profil.dart';
import 'package:provider/provider.dart';
import 'package:littlegrowth/view/login.dart';
import 'package:littlegrowth/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider<AnakService>(
          create: (context) => AnakService(),
        ),
        ChangeNotifierProvider<LaporanFisikService>(
          create: (context) => LaporanFisikService(),
        ),
        ChangeNotifierProvider<LaporanAkademikService>(
          create: (context) => LaporanAkademikService(),
        ),
      ],
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
        '/tambah_profil_anak': (context) =>
            TambahProfilAnak(), // Tambahkan route untuk TambahProfilAnak
      },
    );
  }
}
