// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:littlegrowth/auth_service.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:provider/provider.dart';

class AkunPendidikScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Account'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/pendidik_profile.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hani',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      'Nama',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Siti Hanifah S.PD.AUD',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'E-mail',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'sitihanifah123@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Guru Kelas A',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //logika sign out
                    await authService.logout();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Anda telah keluar.')),
                    );
                  },
                  child: Text('Sign Out'),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
