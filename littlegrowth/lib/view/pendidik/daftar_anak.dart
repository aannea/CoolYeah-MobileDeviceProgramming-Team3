// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_anaks.dart';
import 'package:littlegrowth/view/pendidik/services/anaks_service.dart';
import 'package:littlegrowth/view/pendidik/tambah_data_main.dart';
import 'package:provider/provider.dart';

class DaftarAnak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Laporan Anak', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot<Murid>>(
          // StreamBuilder to listen to changes in the stream
          stream: Provider.of<AnakService>(context)
              .getmurids(), // Obtain the stream of Murid objects from AnakService
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for data, show a loading indicator
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If an error occurs, display an error message
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // If data is available, display it in the UI
              final murids = snapshot.data!.docs;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      'Daftar Anak-Anak',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    // Iterate through the documents and display each one
                    for (var murid in murids)
                      buildMuridListItem(context, murid),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildMuridListItem(
      BuildContext context, QueryDocumentSnapshot<Murid> murid) {
    // Extract data from the document snapshot
    final String namaLengkap = murid['nama_lengkap'];
    // You can extract other fields similarly

    // Return a widget representing the list item
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahDataAnakMainScreen(murid: murid),
            ),
          );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/account.png'),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(
                  namaLengkap,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(), // Add a spacer to push the IconButton to the right
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TambahDataAnakMainScreen(murid: murid)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
