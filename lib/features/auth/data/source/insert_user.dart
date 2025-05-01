import 'package:cloud_firestore/cloud_firestore.dart';

class InsertUser {
  final FirebaseFirestore _firestore;
  InsertUser(this._firestore);
  Future<void> insertUserData(String userId, String email, String name) async {
    try {
      final docRef =
          await FirebaseFirestore.instance.collection('user').doc(userId).get();
      if (!docRef.exists) {
        await _firestore.collection('user').doc(userId).set({
          'email': email,
          'name': name,
        });
      }
    } catch (e) {
      throw Exception("Failed to insert user data: $e");
    }
  }
}
