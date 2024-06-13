// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_anaks.dart';
import 'package:littlegrowth/view/pendidik/services/laporan_fisiks_anak_service.dart';
import 'package:littlegrowth/view/pendidik/tambah_data_fisik.dart';
import 'package:littlegrowth/view/pendidik/tambah_sosial.dart';
import 'tambah_emosional.dart';
import 'tambah_kognitif.dart';
import 'tambah_motorik.dart';

class TambahDataAnakMainScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Murid> murid;
  final LaporanFisikService _laporanFisikService = LaporanFisikService();

  TambahDataAnakMainScreen({super.key, required this.murid}) {
    idMurid = murid['id'];
    nameMurid = murid['nama_lengkap'];
    birthdayMurid = murid['birthday'];
  }

  String? idMurid;
  String? nameMurid;
  String? birthdayMurid;

  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Ags',
    'Sep',
    'Okt',
    'Nov',
    'Des'
  ];

  @override
  Widget build(BuildContext context) {
    print('id murid: $idMurid');

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
            SizedBox(
              height: 30,
            ),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '$nameMurid',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$birthdayMurid',
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
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: months.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: index % 2 == 0
                        ? buildFisikCardBlue(
                            context,
                            months[index],
                            murid,
                          )
                        : buildFisikCardPink(
                            context,
                            months[index],
                            murid,
                          ),
                  );
                },
              ),
            ),

            //LAPORAN AKADEMIK
            SizedBox(
              height: 50,
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Color.fromRGBO(98, 201, 216, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Laporan Akademik',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
                                    builder: (context) => LaporanKognitif(
                                          muridId: murid.id,
                                        )),
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
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LaporanMotorik(
                                          muridId: murid.id,
                                        )),
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
                          ),
                        ),
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
                                    builder: (context) => LaporanEmosional(
                                          muridId: murid.id,
                                        )),
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
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LaporanSosial(
                                          muridId: murid.id,
                                        )),
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFisikCardPink(
    BuildContext context,
    String month,
    QueryDocumentSnapshot<Murid> murid,
  ) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahDataFisik(
                murid: murid,
              ),
            ),
          );
        },
        child: Container(
          height: 80,
          width: 70,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFFF59999),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  month,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'TB',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'BB',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'LK',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFisikCardBlue(
    BuildContext context,
    String month,
    QueryDocumentSnapshot<Murid> murid,
  ) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahDataFisik(murid: murid),
            ),
          );
        },
        child: Container(
          height: 80,
          width: 70,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFF62C9D8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  month,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'TB',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'BB',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'LK',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
