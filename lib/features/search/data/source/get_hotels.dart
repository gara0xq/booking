import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/hotel_model.dart';

class GetHotels {
  FirebaseFirestore firestore;
  GetHotels(this.firestore);

  Future<List<HotelModel>> getHotels() async {
    List<HotelModel> hotels = [];

    try {
      final response = await firestore.collection("hotel").get();
      for (var doc in response.docs) {
        hotels.add(HotelModel.fromMap(doc.data()));
      }
    } catch (e) {
      log("Error fetching filters: $e");
    }
    return hotels;
  }
}
