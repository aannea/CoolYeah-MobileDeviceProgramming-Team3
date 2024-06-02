// ignore_for_file: prefer_const_constructors, prefer_final_fields, sort_child_properties_last

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/akun_pendidik.dart';
import 'package:littlegrowth/view/pendidik/home.dart';
import 'package:littlegrowth/view/pendidik/laporan_keseluruhan.dart';
import 'package:littlegrowth/view/pendidik/tambah_data_anak.dart';
import 'package:littlegrowth/view/pendidik/tambah_data_main.dart';

class MainPendidikNavigator extends StatefulWidget {
  const MainPendidikNavigator({super.key});

  @override
  State<MainPendidikNavigator> createState() => _MainPendidikNavigatorState();
}

class _MainPendidikNavigatorState extends State<MainPendidikNavigator> {
  // int index = 2;
  PageController _pageController = PageController();

  final items = <Widget>[
    Icon(Icons.bar_chart, size: 30),
    Icon(Icons.grade, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.edit, size: 30),
    Icon(Icons.person, size: 30),
  ];

  int _selectedIndex = 2;

  List<Widget> _screens = [
    LaporanKeseluruhanAnaksScreen(),
    TambahDataAnakMainScreen(),
    HomePendidik(),
    TambahPesertaAnakScreen(),
    AkunPendidikScreen()
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: HexToColor().hexStringToColor("E67373"),
          height: 60,
          items: items,
          backgroundColor: Colors.transparent,
          onTap: _onItemTapped,
          index: _selectedIndex,
        ),
      ),
    );
  }
}
