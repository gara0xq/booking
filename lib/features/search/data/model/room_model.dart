import '../../domain/entity/room_entity.dart';
import 'hotel_model.dart';

class RoomModel extends RoomEntity {
  RoomModel({
    required super.name,
    required super.description,
    required super.numberOfPersons,
    required super.price,
    required super.hotel,
  });

  factory RoomModel.fromMap(Map<String, dynamic> json) {
    return RoomModel(
      name: json['name'],
      description: json['description'],
      numberOfPersons: json['numberOfPersons'],
      price: json['price'],
      hotel: HotelModel.fromMap(json['hotelID']),
    );
  }
}
