import 'dart:developer';

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

  Future<void> deleteMurid(String muridId) async {
    try {
      // Delete sub-collections first
      await deleteSubCollections('murids', muridId, 'laporan_akademik');
      await deleteSubCollections('murids', muridId, 'laporan_fisik');

      // Delete the murid document
      await _firestore.collection('murids').doc(muridId).delete();

      // Delete the user document
      await _firestore.collection('users').doc(muridId).delete();

      // Get the user credentials
      User? user = _auth.currentUser;

      // Re-authenticate if necessary
      if (user?.uid == muridId) {
        // Delete the user account from Firebase Authentication
        await user?.delete();
        // await FirebaseAuth.instance.currentUser!.delete();
      }
    } on FirebaseAuthException catch (e) {
      log('catch $e');

      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteSubCollections(
    String collectionPath,
    String docId,
    String subCollectionName,
  ) async {
    try {
      QuerySnapshot subCollectionSnapshot = await _firestore
          .collection(collectionPath)
          .doc(docId)
          .collection(subCollectionName)
          .get();

      for (DocumentSnapshot subDoc in subCollectionSnapshot.docs) {
        await subDoc.reference.delete();
      }
    } catch (e) {
      print('Error deleting sub-collection: $e');
    }
  }

  Future<void> _reauthenticateAndDelete() async {
    try {
      final providerData = _auth.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await _auth.currentUser!
            .reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await _auth.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }

      await _auth.currentUser?.delete();
    } catch (e) {
      print('Error: $e');
    }
  }
}
