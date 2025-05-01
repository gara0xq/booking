import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetSuggestionCountries {
  FirebaseFirestore firestore;
  GetSuggestionCountries(this.firestore);

  Future<List<Map<String, dynamic>>> getSuggestionCountries() async {
    List<Map<String, dynamic>> suggestions = [];

    try {
      final response = await firestore.collection("suggestionsCities").get();
      for (var doc in response.docs) {
        suggestions.add(doc.data());
      }
    } catch (e) {
      log("Error fetching suggestion: $e");
    }
    return suggestions;
  }
}
