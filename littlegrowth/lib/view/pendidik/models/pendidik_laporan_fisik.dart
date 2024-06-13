import 'package:cloud_firestore/cloud_firestore.dart';

class LaporanFisiksAnak {
  final String id;
  final int? bb; // Berat Badan
  final int? tinggi;
  final int? lingkarKepala;
  final Timestamp? date;

  LaporanFisiksAnak({
    required this.id,
    this.bb,
    this.tinggi,
    this.lingkarKepala,
    this.date,
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

  factory LaporanFisiksAnak.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return LaporanFisiksAnak(
      id: doc.id,
      bb: data['bb'] ?? 0,
      tinggi: data['tinggi'] ?? 0,
      lingkarKepala: data['lingkar_kepala'] ?? 0,
      date: data['date'] ?? Timestamp.now(),
    );
  }
}
