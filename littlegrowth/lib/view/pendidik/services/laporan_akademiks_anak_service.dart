import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_laporan_akademik.dart';

class LaporanAkademikService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<LaporanAkademiksAnak> _getLaporanAkademikCollection(
      String muridId) {
    return _firestore
        .collection('murids')
        .doc(muridId)
        .collection('laporan_akademik')
        .withConverter<LaporanAkademiksAnak>(
          fromFirestore: (snapshot, _) =>
              LaporanAkademiksAnak.fromJson(snapshot.data()!),
          toFirestore: (laporanAkademik, _) => laporanAkademik.toJson(),
        );
  }

  Stream<QuerySnapshot<LaporanAkademiksAnak>> getLaporanAkademikStream(
      String muridId) {
    return _getLaporanAkademikCollection(muridId).snapshots();
  }

  Future<DocumentSnapshot<LaporanAkademiksAnak>> getLaporanAkademikById(
      String muridId, String laporanId) async {
    try {
      // Mendapatkan dokumen dengan laporanId dari koleksi laporan akademik untuk murid tertentu
      DocumentSnapshot<LaporanAkademiksAnak> docSnapshot =
          await _getLaporanAkademikCollection(muridId).doc(laporanId).get();

      // Memeriksa apakah dokumen ditemukan
      if (docSnapshot.exists) {
        return docSnapshot;
      } else {
        throw Exception(
            "Document not found"); // Melemparkan error jika dokumen tidak ditemukan
      }
    } catch (e) {
      print('Error fetching laporan akademik: $e');
      throw e; // Melemparkan error untuk dikelola di lapisan yang lebih tinggi
    }
  }

  Future<String?> getOneLaporanAkademikId(String muridId) async {
    try {
      // Mendapatkan QuerySnapshot dari koleksi laporan akademik untuk murid tertentu
      QuerySnapshot<LaporanAkademiksAnak> querySnapshot =
          await _getLaporanAkademikCollection(muridId).get();

      // Mengambil ID dari satu dokumen pertama jika ada
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id;
      } else {
        return null; // Mengembalikan null jika tidak ada dokumen
      }
    } catch (e) {
      print('Error getting laporan ID: $e');
      throw e; // Melemparkan error untuk dikelola di lapisan yang lebih tinggi
    }
  }

  Future<void> createLaporanAkademik({
    required String muridId,
    String? emosiDeskripsi,
    String? emosiRekomendasi,
    String? kognitifDeskripsi,
    String? kognitifRekomendasi,
    String? motorikDeskripsi,
    String? motorikRekomendasi,
    String? sosialDeskripsi,
    String? sosialRekomendasi,
    String? nilaiAnakKognitif,
    String? nilaiAnakEmosi,
    String? nilaiAnakMotorik,
    String? nilaiAnakSosial,
  }) async {
    try {
      String id = _firestore.collection('murids').doc().id;
      LaporanAkademiksAnak laporanAkademik = LaporanAkademiksAnak(
        id: id,
        emosiDeskripsi: emosiDeskripsi,
        emosiRekomendasi: emosiRekomendasi,
        kognitifDeskripsi: kognitifDeskripsi,
        kognitifRekomendasi: kognitifRekomendasi,
        motorikDeskripsi: motorikDeskripsi,
        motorikRekomendasi: motorikRekomendasi,
        sosialDeskripsi: sosialDeskripsi,
        sosialRekomendasi: sosialRekomendasi,
        nilaiAnakKognitif: nilaiAnakKognitif,
        nilaiAnakEmosi: nilaiAnakEmosi,
        nilaiAnakMotorik: nilaiAnakMotorik,
        nilaiAnakSosial: nilaiAnakSosial,
      );

      await _getLaporanAkademikCollection(muridId).doc(id).set(laporanAkademik);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateLaporanAkademik({
    required String muridId,
    required String laporanId,
    String? emosiDeskripsi,
    String? emosiRekomendasi,
    String? kognitifDeskripsi,
    String? kognitifRekomendasi,
    String? motorikDeskripsi,
    String? motorikRekomendasi,
    String? sosialDeskripsi,
    String? sosialRekomendasi,
    String? nilaiAnakKognitif,
    String? nilaiAnakEmosi,
    String? nilaiAnakMotorik,
    String? nilaiAnakSosial,
  }) async {
    try {
      Map<String, dynamic> updateData = {};
      if (emosiDeskripsi != null) {
        updateData['emosi_deskripsi'] = emosiDeskripsi;
      }
      if (emosiRekomendasi != null) {
        updateData['emosi_rekomendasi'] = emosiRekomendasi;
      }
      if (kognitifDeskripsi != null) {
        updateData['kognitif_deskripsi'] = kognitifDeskripsi;
      }
      if (kognitifRekomendasi != null) {
        updateData['kognitif_rekomendasi'] = kognitifRekomendasi;
      }
      if (motorikDeskripsi != null) {
        updateData['motorik_deskripsi'] = motorikDeskripsi;
      }
      if (motorikRekomendasi != null) {
        updateData['motorik_rekomendasi'] = motorikRekomendasi;
      }
      if (sosialDeskripsi != null) {
        updateData['sosial_deskripsi'] = sosialDeskripsi;
      }
      if (sosialRekomendasi != null) {
        updateData['sosial_rekomendasi'] = sosialRekomendasi;
      }
      if (nilaiAnakKognitif != null) {
        updateData['nilai_anak_kognitif'] = nilaiAnakKognitif;
      }
      if (nilaiAnakEmosi != null) {
        updateData['nilai_anak_emosi'] = nilaiAnakEmosi;
      }
      if (nilaiAnakMotorik != null) {
        updateData['nilai_anak_motorik'] = nilaiAnakMotorik;
      }
      if (nilaiAnakSosial != null) {
        updateData['nilai_anak_sosial'] = nilaiAnakSosial;
      }

      await _getLaporanAkademikCollection(muridId)
          .doc(laporanId)
          .update(updateData);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteLaporanAkademik({
    required String muridId,
    required String laporanId,
  }) async {
    try {
      await _getLaporanAkademikCollection(muridId).doc(laporanId).delete();
    } catch (e) {
      print('Error: $e');
    }
  }
}
