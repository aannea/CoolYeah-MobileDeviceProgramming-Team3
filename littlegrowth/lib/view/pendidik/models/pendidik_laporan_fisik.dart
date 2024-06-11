import 'package:cloud_firestore/cloud_firestore.dart';

class LaporanFisiksAnak {
  final String id;
  final int bb; // Berat Badan
  final int tinggi;
  final int lingkarKepala;
  final Timestamp date;

  LaporanFisiksAnak({
    required this.id,
    required this.bb,
    required this.tinggi,
    required this.lingkarKepala,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bb': bb,
      'tinggi': tinggi,
      'lingkar_kepala': lingkarKepala,
      'date': date,
    };
  }

  factory LaporanFisiksAnak.fromJson(Map<String, dynamic> json) {
    return LaporanFisiksAnak(
      id: json['id'] as String,
      bb: json['bb'] as int,
      tinggi: json['tinggi'] as int,
      lingkarKepala: json['lingkar_kepala'] as int,
      date: json['date'] as Timestamp,
    );
  }
}
