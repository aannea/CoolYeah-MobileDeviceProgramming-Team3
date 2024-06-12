import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class LaporanKognitifAnak extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perkembangan Anak', style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Kognitif Anak',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xFFFE67373),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'Deskripsi',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 300, width: 500,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                    'Anak memiliki kognitif yang bagus. Ia sudah pandai berbicara dengan runtutan yang jelas. Namun terkadang masih ada kesalahan ketika membaca'
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xFFFE67373),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'Rekomendasi',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 300, width: 500,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                    'Perkembangannya cukup cepat, bisa diajarkan membaca dan menulis, dibelikan buku cerita bergambar supaya anak tertarik membaca bukunya'
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Tumbuh Kembang Anak',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50, width: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'Value: B. Baik', style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}