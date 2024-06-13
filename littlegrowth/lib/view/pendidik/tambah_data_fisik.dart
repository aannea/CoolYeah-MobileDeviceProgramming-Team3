import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_anaks.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_laporan_fisik.dart';
import 'package:littlegrowth/view/pendidik/services/laporan_fisiks_anak_service.dart';
import 'package:provider/provider.dart';

class TambahDataFisik extends StatefulWidget {
  QueryDocumentSnapshot<LaporanFisiksAnak>? laporanFisiksAnak;
  final QueryDocumentSnapshot<Murid> murid;

  TambahDataFisik({super.key, this.laporanFisiksAnak, required this.murid}) {
    nameMurid = murid['nama_lengkap'];
    birthdayMurid = murid['birthday'];
  }

  String? idMurid;
  String? nameMurid;
  String? birthdayMurid;

  @override
  _TambahDataFisikState createState() => _TambahDataFisikState();
}

class _TambahDataFisikState extends State<TambahDataFisik> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController bbController;
  late TextEditingController tinggiController;
  late TextEditingController lingkarKepalaController;
  late bool isUpdate;

  final LaporanFisikService _laporanFisikService = LaporanFisikService();

  @override
  void initState() {
    super.initState();
    print(widget.laporanFisiksAnak);
    isUpdate = widget.laporanFisiksAnak != null;
    bbController = TextEditingController(
        text: isUpdate ? widget.laporanFisiksAnak!['bb'].toString() : '');
    tinggiController = TextEditingController(
        text: isUpdate ? widget.laporanFisiksAnak!['tinggi'].toString() : '');
    lingkarKepalaController = TextEditingController(
        text: isUpdate
            ? widget.laporanFisiksAnak!['lingkar_kepala'].toString()
            : '');
  }

  @override
  void dispose() {
    bbController.dispose();
    tinggiController.dispose();
    lingkarKepalaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Data Anak' : 'Tambah Data Anak',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/child.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.nameMurid!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.birthdayMurid!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                buildDataField('Berat Badan', bbController),
                buildDataField('Tinggi Badan', tinggiController),
                buildDataField('Lingkar Kepala', lingkarKepalaController),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (isUpdate) {
                          _updateLaporanFisik();
                        } else {
                          _createLaporanFisik();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: StreamBuilder<QuerySnapshot<LaporanFisiksAnak>>(
                      stream: Provider.of<LaporanFisikService>(context)
                          .getLaporanFisikStream(
                        widget.murid.id,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List laporanFisikList = snapshot.data?.docs ?? [];
                        if (laporanFisikList.isEmpty) {
                          return Center(
                            child: Text("Tambahkan Laporan Fisik!"),
                          );
                        }
                        return ListView.builder(
                          itemCount: laporanFisikList.length,
                          itemBuilder: (context, index) {
                            LaporanFisiksAnak laporanFisik =
                                laporanFisikList[index].data();
                            return Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text('ID: ${laporanFisik.id}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Berat Badan: ${laporanFisik.bb}',
                                    ),
                                    Text(
                                      'Tinggi Badan: ${laporanFisik.tinggi}',
                                    ),
                                    Text(
                                      'Lingkar Kepala: ${laporanFisik.lingkarKepala}',
                                    ),
                                    Text(
                                      'Tanggal: ${laporanFisik.date?.toDate()}',
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          bbController.text =
                                              laporanFisik.bb.toString();
                                          tinggiController.text =
                                              laporanFisik.tinggi.toString();
                                          lingkarKepalaController.text =
                                              laporanFisik.lingkarKepala
                                                  .toString();
                                          isUpdate = true;
                                          widget.laporanFisiksAnak =
                                              laporanFisikList[index];
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        _deleteLaporanFisik(
                                            laporanFisikList[index].id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDataField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  void _createLaporanFisik() {
    _laporanFisikService
        .createLaporanFisik(
      muridId: widget.murid.id,
      bb: int.parse(bbController.text),
      tinggi: int.parse(tinggiController.text),
      lingkarKepala: int.parse(lingkarKepalaController.text),
      date: Timestamp.now(),
    )
        .then((_) {
      Navigator.pop(context);
    }).catchError((error) {
      print('Failed to add laporan fisik: $error');
    });
  }

  void _updateLaporanFisik() {
    _laporanFisikService
        .updateLaporanFisik(
      muridId: widget.murid.id,
      laporanId: widget.laporanFisiksAnak!.id,
      bb: int.parse(bbController.text),
      tinggi: int.parse(tinggiController.text),
      lingkarKepala: int.parse(lingkarKepalaController.text),
      date: Timestamp.now(),
    )
        .then((_) {
      Navigator.pop(context);
    }).catchError((error) {
      print('Failed to update laporan fisik: $error');
    });
  }

  void _deleteLaporanFisik(String laporanId) {
    _laporanFisikService
        .deleteLaporanFisik(muridId: widget.murid.id, laporanId: laporanId)
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Laporan fisik berhasil dihapus')),
      );
    }).catchError((error) {
      print('Failed to delete laporan fisik: $error');
    });
  }
}
