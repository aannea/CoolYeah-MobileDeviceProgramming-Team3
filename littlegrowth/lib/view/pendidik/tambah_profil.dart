import 'package:flutter/material.dart';

class TambahProfilAnak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Tambah Data Anak'),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/abraham.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Abraham',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildDataField('Nama'),
              buildDataField('Nomor Induk Kependidikan'),
              buildDataField('Tanggal Lahir'),
              buildDataField('Jenis Kelamin'),
              buildDataField('Username'),
              buildDataField('Password'),
              SizedBox(height: 100), // Add some spacing before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // tambah ke backend
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tambah Anak Baru',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFF0097BD)),
                      ),
                      SizedBox(width: 8), // Spasi antara teks dan ikon
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDataField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
