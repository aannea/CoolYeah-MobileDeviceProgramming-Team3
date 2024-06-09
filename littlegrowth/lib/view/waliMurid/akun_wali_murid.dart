// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class AkunWaliMuridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile User'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Center(
        child: Text('Informasi profil pengguna akan di sini'),
      ),
    );
  }
}
