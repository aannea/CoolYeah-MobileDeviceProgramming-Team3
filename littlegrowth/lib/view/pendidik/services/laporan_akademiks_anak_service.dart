import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_laporan_akademik.dart';

class LaporanAkademikService {
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
  }) async {
    try {
      // Create subcollections for laporan_akademik
      await _firestore
          .collection('murids')
          .doc(muridId)
          .collection('laporan_akademik')
          .add({});

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

  Stream<QuerySnapshot<LaporanAkademiksAnak>> getLaporanAkademikStream(
      String muridId) {
    return _getLaporanAkademikCollection(muridId).snapshots();
  }
}
