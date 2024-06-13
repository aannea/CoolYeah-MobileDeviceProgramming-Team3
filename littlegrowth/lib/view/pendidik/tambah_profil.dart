// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/view/pendidik/services/anaks_service.dart';
import 'package:provider/provider.dart';

class TambahProfilAnak extends StatefulWidget {
  @override
  _TambahProfilAnakState createState() => _TambahProfilAnakState();
}

class _TambahProfilAnakState extends State<TambahProfilAnak> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _jenisKelaminController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            'Tambah Data Anak',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
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
                      backgroundImage: AssetImage('images/account.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Data Anak',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildDataField('Nama Lengkap', _namaLengkapController),
              buildDataField('Nomor Induk Kependidikan', _nikController),
              buildDataField('Tanggal Lahir', _birthdayController),
              buildDataField('Jenis Kelamin', _jenisKelaminController),
              buildDataField('Username', _usernameController),
              buildDataField('Email', _emailController),
              buildDataField('Password', _passwordController),
              SizedBox(height: 100),
              Center(
                child: ElevatedButton(
                  onPressed: () => _createMurid(context),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tambah Anak Baru',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFFF0097BD)),
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

  Widget buildDataField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void _createMurid(BuildContext context) async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String namaLengkap = _namaLengkapController.text;
    final String jenisKelamin = _jenisKelaminController.text;
    final String birthday = _birthdayController.text;
    final String nik = _nikController.text;
    final String username = _usernameController.text;

    if (email.isEmpty ||
        password.isEmpty ||
        namaLengkap.isEmpty ||
        jenisKelamin.isEmpty ||
        birthday.isEmpty ||
        nik.isEmpty ||
        username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Semua bidang harus diisi'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final AnakService anakService =
        Provider.of<AnakService>(context, listen: false);

    try {
      print('Starting createMurid...');
      await anakService.createMurid(
          email: email,
          password: password,
          namaLengkap: namaLengkap,
          jenisKelamin: jenisKelamin,
          birthday: birthday,
          nik: nik,
          role: 'murid',
          username: username);
      print('createMurid completed successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil buat profil murid'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error in createMurid: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
