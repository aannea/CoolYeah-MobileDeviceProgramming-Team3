// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class EditProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Peserta Didik',

      home: editprofile(),
    );
  }
}
class editprofile extends StatefulWidget{
  @override
  editprofileState createState() => editprofileState();
}

class editprofileState extends State<editprofile> {
  final nameController = TextEditingController(text: 'Lando Noris');
  final idController = TextEditingController(text: '87654321273');
  final birthdateController = TextEditingController(text: '07/Februari/2009');
  final genderController = TextEditingController(text: 'Laki-laki');
  final usernameController = TextEditingController(text: 'LandoNoris');
  final passwordController = TextEditingController(text: 'Lando123');

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Peserta Didik'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
            },
          ),
        ),
        backgroundColor: HexToColor().hexStringToColor("62C9D8"),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/abraham.png'), // Replace with your asset image
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                  ),
                ),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: 'Nomor Induk Kependudukan',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: birthdateController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                  ),
                ),
                TextField(
                  controller: genderController,
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle save button press
                  },
                  child: Text('Simpan Data Terbaru'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle delete button press
                  },
                  child: Text(
                    'Hapus Anak',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}