import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_anaks.dart';

class AnakService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<Murid> _muridsRef;

  AnakService() {
    muridService();
  }

  muridService() {
    _muridsRef = _firestore.collection('murids').withConverter<Murid>(
          fromFirestore: (snapshots, _) => Murid.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (murid, _) => murid.toJson(),
        );
  }

  Future<void> createMurid({
    required String email,
    required String password,
    required String namaLengkap,
    required String jenisKelamin,
    required String birthday,
    required String nik,
    required String role,
    required String username,
  }) async {
    try {
      // Create user using FirebaseAuth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user?.uid ?? ''; // Get the user ID

      // Save user data in Firestore
      await _firestore.collection('murids').doc(uid).set({
        'email': email,
        'nama_lengkap': namaLengkap,
        'username': username,
        'jenis_kelamin': jenisKelamin,
        'birthday': birthday,
        'nik': nik,
        'role': role,
      });

      // Save user data in users collection
      await _firestore.collection('users').doc(uid).set({
        'id': uid,
        'email': email,
        'role': role,
      });

      // Create subcollections for laporan_akademik and laporan_fisik
      await _firestore
          .collection('murids')
          .doc(uid)
          .collection('laporan_akademik')
          .add({});
      await _firestore
          .collection('murids')
          .doc(uid)
          .collection('laporan_fisik')
          .add({});
    } catch (e) {
      print('Error: $e');
    }
  }

  Stream<QuerySnapshot<Murid>> getmurids() {
    return _muridsRef.snapshots();
  }

  Future<void> updateMurid({
    String? id,
    String? email,
    String? namaLengkap,
    String? jenisKelamin,
    String? birthday,
    String? nik,
    String? role,
    String? username,
  }) async {
    try {
      // Create a map of the data to be updated
      Map<String, dynamic> muridData = {};
      if (email != null) muridData['email'] = email;
      if (namaLengkap != null) muridData['nama_lengkap'] = namaLengkap;
      if (jenisKelamin != null) muridData['jenis_kelamin'] = jenisKelamin;
      if (birthday != null) muridData['birthday'] = birthday;
      if (nik != null) muridData['nik'] = nik;
      if (role != null) muridData['role'] = role;
      if (username != null) muridData['username'] = username;

      if (muridData.isNotEmpty) {
        // Update the murid document
        await _firestore.collection('murids').doc(id).update(muridData);
      }

      // Update the users collection if email or role is provided
      Map<String, dynamic> userData = {};
      if (id != null) userData['id'] = id;
      if (email != null) userData['email'] = email;
      if (role != null) userData['role'] = role;

      if (userData.isNotEmpty) {
        await _firestore.collection('users').doc(id).update(userData);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteMurid(String id) async {
    try {
      // Delete the murid document
      await _firestore.collection('murids').doc(id).delete();

      // Delete the user document
      await _firestore.collection('users').doc(id).delete();

      // Get the user credentials
      User? user = _auth.currentUser;

      // Re-authenticate if necessary
      if (user?.uid == id) {
        // Delete the user account from Firebase Authentication
        await user?.delete();
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
