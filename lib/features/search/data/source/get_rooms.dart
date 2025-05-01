import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_app/features/search/data/model/hotel_model.dart';
import 'package:main_app/features/search/domain/entity/room_entity.dart';

class GetRooms {
  final FirebaseFirestore _firestore;
  GetRooms(this._firestore);

  List<RoomEntity> rooms = [];

  Future<List<RoomEntity>> getRooms() async {
    try {
      final hotels = await _firestore.collection('hotel').get();
      for (var e in hotels.docs) {
        final roomsData = await _firestore
            .collection('hotel')
            .doc(e.id)
            .collection("rooms")
            .get();

        rooms.addAll(
          roomsData.docs
              .map(
                (doc) => RoomEntity(
                  name: doc.data()["name"],
                  description: doc.data()["description"],
                  numberOfPersons: doc.data()["numberOfPersons"],
                  price: doc.data()["price"],
                  hotel: HotelModel.fromMap(e.data()),
                ),
              )
              .toList(),
        );
      }

      return rooms;
    } catch (e) {
      log("Error fetching rooms: $e");
      return [];
    }
  }
}
