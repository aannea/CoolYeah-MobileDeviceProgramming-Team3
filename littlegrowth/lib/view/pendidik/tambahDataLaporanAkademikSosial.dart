import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class LaporanSosial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perkembangan Sosial Anak'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perkembangan Anak',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Deskripsi'),
            SizedBox(height: 8),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Deskripsikan Perkembangan Sosial Anak',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text('Rekomendasi'),
            SizedBox(height: 8),
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
            SizedBox(height: 20),
            Text('Tumbuh Kembang Anak'),
            SizedBox(height: 8),

            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(Icons.star_border),
                  onPressed: () {
                    //handle star
                  },
                );
              }),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}