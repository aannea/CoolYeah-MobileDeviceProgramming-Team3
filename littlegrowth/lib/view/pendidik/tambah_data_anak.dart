// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/tambah_data_main.dart';
import 'tambah_data_anak.dart';
import 'tambah_profil.dart';
import 'edit_profil.dart';

class TambahPesertaAnakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Anak'),
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Daftar Anak-Anak',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //data 1
                    SizedBox(width: 25,),
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditProfil()),
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
                                    backgroundImage: AssetImage('./../images/child.png'),
                                    radius: 25,
                                  ),
                                  SizedBox(width: 10,),
                                  Center(
                                    child: Text(
                                      'Casey Caspol',
                                      style: TextStyle(
                                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget> [
                                          IconButton(
                                              icon : Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => EditProfil())
                                                );
                                              }
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),

                //data 2
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //data 1
                    SizedBox(width: 25,),
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TambahProfilAnak()),
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
                                    backgroundImage: AssetImage('./../images/child.png'),
                                    radius: 25,
                                  ),
                                  SizedBox(width: 10,),
                                  Center(
                                    child: Text(
                                      'Jasmine Auliya',
                                      style: TextStyle(
                                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget> [
                                          IconButton(
                                              icon : Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => EditProfil())
                                                );
                                              }
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //data 1
                    SizedBox(width: 25,),
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TambahProfilAnak()),
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
                                    backgroundImage: AssetImage('./../images/child.png'),
                                    radius: 25,
                                  ),
                                  SizedBox(width: 10,),
                                  Center(
                                    child: Text(
                                      'Park Jee',
                                      style: TextStyle(
                                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget> [
                                          IconButton(
                                              icon : Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => TambahProfilAnak())
                                                );
                                              }
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
      //button
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: SizedBox(
          height: 80, width: 80,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TambahProfilAnak()),
              );
            },
            child: Icon(Icons.add, size: 40, color: Color(0xFFF59999),),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}