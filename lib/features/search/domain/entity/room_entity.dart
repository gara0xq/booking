import '../entity/hotel_entity.dart';

class RoomEntity {
  final String description;
  final String name;
  final int numberOfPersons;
  final double price;
  final HotelEntity hotel;

  RoomEntity({
    required this.name,
    required this.description,
    required this.numberOfPersons,
    required this.price,
    required this.hotel,
  });
}
