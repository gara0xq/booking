import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetFilters {
  FirebaseFirestore firestore;
  GetFilters(this.firestore);

  Future<Map<String, dynamic>> getFilters() async {
    Map<String, dynamic> filters = {};

    try {
      final querySnapshot =
          await firestore.collection("filters").doc("f1").get();
      filters = querySnapshot.data()!;
    } catch (e) {
      log("Error fetching filters: $e");
    }
    return filters;
  }
}
