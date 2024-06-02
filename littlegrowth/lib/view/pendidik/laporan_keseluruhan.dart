// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class LaporanKeseluruhanAnaksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Data Anaks'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Center(
        child: Text('Daftar laporan data anak-anak akan di sini'),
      ),
    );
  }
}
