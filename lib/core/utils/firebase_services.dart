import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('tenant');

  Future<void> updateProfile(String newName) async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      await usersCollection.doc(user!.uid).update({'name': newName});
    } catch (error) {
      print('Failed to update profile. Error: $error');
    }
  }
}
