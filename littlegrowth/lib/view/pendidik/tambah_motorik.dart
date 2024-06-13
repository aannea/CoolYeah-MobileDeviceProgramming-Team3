import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_laporan_akademik.dart';
import 'package:littlegrowth/view/pendidik/services/laporan_akademiks_anak_service.dart';

class LaporanMotorik extends StatefulWidget {
  String? laporanId;
  final String muridId;

  LaporanMotorik({this.laporanId, required this.muridId});

  @override
  _LaporanMotorikState createState() => _LaporanMotorikState();
}

class _LaporanMotorikState extends State<LaporanMotorik> {
  final _formKey = GlobalKey<FormState>();
  final LaporanAkademikService _service = LaporanAkademikService();

  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _rekomendasiController = TextEditingController();
  String? _selectedGrade;

  @override
  void initState() {
    super.initState();
    _loadExistingLaporan();
  }

  Future<void> _loadExistingLaporan() async {
    try {
      String? laporanId =
          await _service.getOneLaporanAkademikId(widget.muridId);
      widget.laporanId = laporanId;
      print(laporanId);
      DocumentSnapshot<LaporanAkademiksAnak> doc = await _service
          .getLaporanAkademikById(widget.muridId, widget.laporanId!);
      LaporanAkademiksAnak? laporan = doc.data();
      if (laporan != null) {
        setState(() {
          _deskripsiController.text = laporan.motorikDeskripsi ?? '';
          _rekomendasiController.text = laporan.motorikRekomendasi ?? '';
          _selectedGrade = laporan.nilaiAnakMotorik;
        });
      }
    } catch (e) {
      print('Error loading laporan: $e');
    }
  }

  Future<void> _saveLaporan() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedGrade == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a grade')),
        );
        return;
      }

      try {
        if (widget.laporanId == null) {
          await _service.createLaporanAkademik(
            muridId: widget.muridId,
            motorikDeskripsi: _deskripsiController.text,
            motorikRekomendasi: _rekomendasiController.text,
            nilaiAnakMotorik: _selectedGrade,
          );
        } else {
          await _service.updateLaporanAkademik(
            muridId: widget.muridId,
            laporanId: widget.laporanId!,
            motorikDeskripsi: _deskripsiController.text,
            motorikRekomendasi: _rekomendasiController.text,
            nilaiAnakMotorik: _selectedGrade,
          );
        }
        Navigator.pop(context);
      } catch (e) {
        print('Error saving laporan: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving laporan')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perkembangan Motorik Anak',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: HexToColor().hexStringToColor("62C9D8"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Hasil Perkembangan Anak',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFFE67373),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Deskripsi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _deskripsiController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Deskripsikan Perkembangan Motorik Anak',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFFE67373),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Rekomendasi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _rekomendasiController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Deskripsikan Rekomendasi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Rekomendasi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFFE67373),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Tumbuh Kembang Anak',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedGrade,
                    items: [
                      DropdownMenuItem(
                        child: Text('A. Sangat Baik'),
                        value: 'A. Sangat Baik',
                      ),
                      DropdownMenuItem(
                        child: Text('B. Baik'),
                        value: 'B. Baik',
                      ),
                      DropdownMenuItem(
                        child: Text('C. Cukup'),
                        value: 'C. Cukup',
                      ),
                      DropdownMenuItem(
                        child: Text('D. Kurang'),
                        value: 'D. Kurang',
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGrade = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Beri nilai anak',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nilai anak tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveLaporan,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFF229AC6)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                      ),
                    ),
                    child: Text(
                      widget.laporanId == null ? 'Simpan' : 'Update',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
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
}
