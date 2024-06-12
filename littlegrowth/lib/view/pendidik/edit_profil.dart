// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_anaks.dart';
import 'package:littlegrowth/view/pendidik/services/anaks_service.dart';
import 'package:provider/provider.dart';

class EditProfil extends StatelessWidget {
  final QueryDocumentSnapshot<Murid> murid;

  EditProfil({super.key, required this.murid}) {
    // Initialize controller values with murid data
    nameController.text = murid['nama_lengkap'];
    idController.text = murid['nik'];
    birthdateController.text = murid['birthday'];
    genderController.text = murid['jenis_kelamin'];
    usernameController.text = murid['username'];
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void updateDataMurid(BuildContext context) async {
    try {
      await Provider.of<AnakService>(context, listen: false).updateMurid(
        id: murid.id,
        namaLengkap: nameController.text,
        jenisKelamin: genderController.text,
        birthday: birthdateController.text,
        nik: idController.text,
        username: usernameController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data murid berhasil diperbarui'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
      // Show success message or navigate to another screen
    } catch (e) {
      print('Error updating murid: $e');
      // Handle error
    }
  }

  void deleteDataMurid(BuildContext context) async {
    try {
      await Provider.of<AnakService>(context, listen: false)
          .deleteMurid(murid.id);

      // Show success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data murid berhasil dihapus'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.greenAccent,
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      print('Error deleting murid: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Peserta Didik'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
              backgroundImage: AssetImage(
                  'images/child.png'), // Replace with your asset image
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
              controller: TextEditingController(text: '123456'),
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateDataMurid(context);
              },
              child: Text('Simpan Data Terbaru'),
            ),
            TextButton(
              onPressed: () {
                deleteDataMurid(context);
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
