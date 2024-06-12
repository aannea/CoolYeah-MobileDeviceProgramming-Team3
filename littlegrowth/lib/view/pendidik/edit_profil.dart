// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_anaks.dart';
import 'package:littlegrowth/view/pendidik/services/anaks_service.dart';
import 'package:provider/provider.dart';

class EditProfil extends StatelessWidget{
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
        title: Text('Edit Peserta Didik', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: HexToColor().hexStringToColor("62C9D8"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/account.png'), // Replace with your asset image
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              buildBoxedTextField('Nama', nameController),
              buildBoxedTextField('Nomor Induk Kependudukan', idController),
              buildBoxedTextField('Tanggal Lahir', birthdateController),
              buildBoxedTextField('Jenis Kelamin', genderController),
              buildBoxedTextField('Username', usernameController),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    updateDataMurid(context);
                  },
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
                        'Simpan Data Baru',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFFF229AC6)),
                      ),
                      SizedBox(width: 8), // Spasi antara teks dan ikon
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle delete button press
                    deleteDataMurid(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hapus Anak',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFFFE35252)),
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

  Widget buildBoxedTextField(String labelText, TextEditingController controller, [TextInputType keyboardType = TextInputType.text, bool obscureText = false]) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Adjust padding
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
            ),
        );
    }
}