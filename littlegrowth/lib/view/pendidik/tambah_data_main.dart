// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'tambah_emosional.dart';
import 'tambah_kognitif.dart';
import 'tambah_motorik.dart';
import 'tambah_sosial.dart';

class TambahDataAnakMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Anaks'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Laporan Akademik',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LaporanKognitif()),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('./../images/kognitif.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Kognitif',
                            style: TextStyle(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                ),

                SizedBox(width: 16,),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LaporanMotorik()),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('./../images/motorik.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Motorik',
                            style: TextStyle(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LaporanEmosional()),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('./../images/emosional.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Emosional',
                            style: TextStyle(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                ),

                SizedBox(width: 16,),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LaporanMotorik()),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('./../images/sosial.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Sosial',
                            style: TextStyle(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
