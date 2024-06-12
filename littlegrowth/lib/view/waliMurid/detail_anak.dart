// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'home.dart';

class DetailAnakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan User'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/child.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250, height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, 
                          MaterialPageRoute(
                              builder: (context)=> WaliMuridHomeScreen()
                          ),
                      );
                    }, 
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(height: 8,),
                          Text(
                              'Lihat Perkembangan Anak', style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
