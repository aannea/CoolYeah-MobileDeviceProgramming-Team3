// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/tambah_data_main.dart';
import 'tambah_data_anak.dart';

class DaftarAnak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anaks'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Daftar Anak-Anak',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(width: 25,),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TambahDataAnakMainScreen()),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                             children: [
                               CircleAvatar(
                              backgroundImage: AssetImage('./../images/kognitif.png'),
                              radius: 25,
                            ),
                              SizedBox(width: 10,),
                              Center(
                                child: Text(
                                  'Park Jee',
                                  style: TextStyle(
                                    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                               IconButton(

                                 icon : Icon(Icons.arrow_forward),
                                   onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => TambahDataAnakMainScreen())
                                     );
                                   }
                               )
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}