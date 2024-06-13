// ignore_for_file: prefer_const_constructors, prefer_final_fields, sort_child_properties_last

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/waliMurid/akun_wali_murid.dart';
import 'package:littlegrowth/view/waliMurid/detail_anak.dart';
import 'package:littlegrowth/view/waliMurid/home.dart';

class MainMuridNavigator extends StatefulWidget {
  const MainMuridNavigator({super.key});

  @override
  State<MainMuridNavigator> createState() => _MainMuridNavigatorState();
}

class _MainMuridNavigatorState extends State<MainMuridNavigator> {
  PageController _pageController = PageController();

  final items = <Widget>[
    Icon(Icons.grade, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.person, size: 30),
  ];

  int _selectedIndex = 0;

  List<Widget> _screens = [
    DetailAnakScreen(),
    WaliMuridHomeScreen(),
    AkunWaliMuridScreen()
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
