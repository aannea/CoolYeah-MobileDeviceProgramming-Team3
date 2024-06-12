import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class LaporanSosial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perkembangan Sosial Anak',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  'Hasil Perkembangan Anak',
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
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Deskripsikan Perkembangan Kognitif Anak',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
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
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Deskripsikan Rekomendasi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Tumbuh Kembang Anak',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, ),
              ),
              SizedBox(height: 10),

              //dropdown
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(
                      child: Text('A. Sangat Baik'),
                      value: 'A. Sangat Baik',
                    ),
                    DropdownMenuItem(
                      child: Text('B. Baik'),
                      value: 'B. Baik',
                    ),
                    DropdownMenuItem(
                      child: Text('C. Cukup'),
                      value: 'C. Cukup',
                    ),
                    DropdownMenuItem(
                      child: Text('D. Kurang'),
                      value: 'D. Kurang',
                    ),
                  ],
                  onChanged: (String? value){
                    //handle change
                  },
                  hint: Text('Beri nilai anak'),
                ),
              ),

              // Row(
              //   children: List.generate(5, (index) {
              //     return IconButton(
              //       icon: Icon(Icons.star_border),
              //       onPressed: () {
              //         //handle star
              //       },
              //     );
              //   }),
              // ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF229AC6)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
                  ),
                  child: Text(
                    'Simpan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}