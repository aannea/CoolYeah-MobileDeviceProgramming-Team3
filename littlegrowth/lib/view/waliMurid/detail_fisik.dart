// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class DetailFisik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Laporan Perkembangan Fisik', style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        backgroundColor: HexToColor().hexStringToColor("62C9D8"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xFFFE77373),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                            'Laporan Fisik',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white), textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                            color: const Color(0xFFFE77373)),

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Bulan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Berat Badan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Tinggi Badan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Lingkar Kepala',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Januari',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '28kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '120cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '95cm',
                              ),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Februari',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '30kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '125cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '98cm',
                              ),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Maret',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '25kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '110cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '90cm',
                              ),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'April',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Mei',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Juni',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Juli',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Agustus',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'September',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Oktober',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'November',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.white),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Desember',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                    const Color.fromARGB(255, 235, 91, 139)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '23kg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '108cm',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('90cm'),
                            ),
                          ]),
                    ],
                  ),

                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
