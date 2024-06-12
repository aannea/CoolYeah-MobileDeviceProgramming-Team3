import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class LaporanSosialAnak extends StatelessWidget {

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
                  'Sosial Anak',
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
                    'Anak memiliki jiwa sosial yang dapat dilihat dari dia yang mau memulai pembicaraan dengan temannya'
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
                    'Sudah baik, tetap diperhatikan ketika anak mengajak ibu/bapak mengobrol untuk mempertahankan keberaniannya dalam berbicara'
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
                  'Value: A. Sangat Baik', style: TextStyle(fontWeight: FontWeight.bold),
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