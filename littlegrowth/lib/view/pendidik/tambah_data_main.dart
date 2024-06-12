// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_anaks.dart';
import 'package:littlegrowth/view/pendidik/tambah_sosial.dart';
import 'tambah_emosional.dart';
import 'tambah_kognitif.dart';
import 'tambah_motorik.dart';
import 'tambah_data_fisik.dart';

class TambahDataAnakMainScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Murid> murid;

  TambahDataAnakMainScreen({super.key, required this.murid}) {
    // Initialize controller values with murid data
    // nameController.text = murid['nama_lengkap'];
    // idController.text = murid['nik'];
    // birthdateController.text = murid['birthday'];
    // genderController.text = murid['jenis_kelamin'];
    // usernameController.text = murid['username'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Tambah Laporan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: HexToColor().hexStringToColor("FFFFFF"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text(
              'Laporan Fisik',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF62C9D8).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/child.png'),
                          radius: 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Abraham Lincolin',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Usia 5 Tahun',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF62C9D8),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Jan',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFFF59999),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Feb',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF62C9D8),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Mar',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFFF59999),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Apr',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF62C9D8),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Mei',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFFF59999),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Jun',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF62C9D8),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Jul',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFFF59999),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Ags',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF62C9D8),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Sep',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFFF59999),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Okt',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF62C9D8),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Nov',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambahDataFisik()),
                        );
                      },
                      child: Container(
                        height: 80, width: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFFF59999),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Des',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TB : 100cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BB : 25kg',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LK : 90cm',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),

            //LAPORAN AKADEMIK
            SizedBox(
              height: 50,
            ),
            Text(
              'Laporan Akademik',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaporanKognitif()),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/kognitif.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Kognitif',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LaporanMotorik()),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/motorik.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Motorik',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaporanEmosional()),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/emosional.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Emosional',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LaporanSosial()),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/sosial.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Sosial',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
