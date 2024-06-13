import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_laporan_akademik.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_laporan_fisik.dart';

class LaporanFisikService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<LaporanFisiksAnak> _getLaporanFisikCollection(
      String muridId) {
    return _firestore
        .collection('murids')
        .doc(muridId)
        .collection('laporan_fisik')
        .withConverter<LaporanFisiksAnak>(
          fromFirestore: (snapshots, _) =>
              LaporanFisiksAnak.fromJson(snapshots.data()!),
          toFirestore: (laporanFisik, _) => laporanFisik.toJson(),
        );
  }

  Stream<QuerySnapshot<LaporanFisiksAnak>> getLaporanFisikStream(
      String muridId) {
    return _getLaporanFisikCollection(muridId).snapshots();
  }

  Future<void> createLaporanFisik({
    required String muridId,
    required int bb,
    required int tinggi,
    required int lingkarKepala,
    required Timestamp date,
  }) async {
    try {
      // Create subcollections for laporan_akademik
      String id = _firestore.collection('murids').doc().id;
      LaporanFisiksAnak laporanFisik = LaporanFisiksAnak(
        id: id,
        bb: bb,
        tinggi: tinggi,
        lingkarKepala: lingkarKepala,
        date: date,
      );

      await _getLaporanFisikCollection(muridId).doc(id).set(laporanFisik);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateLaporanFisik({
    required String muridId,
    required String laporanId,
    int? bb,
    int? tinggi,
    int? lingkarKepala,
    Timestamp? date,
  }) async {
    try {
      Map<String, dynamic> updateData = {};
      if (bb != null) updateData['bb'] = bb;
      if (tinggi != null) updateData['tinggi'] = tinggi;
      if (lingkarKepala != null) updateData['lingkar_kepala'] = lingkarKepala;
      if (date != null) updateData['date'] = date;

      await _getLaporanFisikCollection(muridId)
          .doc(laporanId)
          .update(updateData);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteLaporanFisik({
    required String muridId,
    required String laporanId,
  }) async {
    try {
      await _getLaporanFisikCollection(muridId).doc(laporanId).delete();
    } catch (e) {
      print('Error: $e');
    }
  }
}
