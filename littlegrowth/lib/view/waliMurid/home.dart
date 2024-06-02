// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class WaliMuridHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wali Murid Home')),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Center(child: Text('Welcome, Wali Murid')),
    );
  }
}