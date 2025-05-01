import '../../domain/entity/hotel_entity.dart';

class HotelModel extends HotelEntity {
  HotelModel({
    required super.name,
    required super.description,
    required super.city,
    required super.addressUrl,
    required super.imagesUrl,
    required super.facilities,
    required super.reviews,
  });

  factory HotelModel.fromMap(Map<String, dynamic> json) {
    return HotelModel(
      name: json['name'],
      description: json['description'],
      city: json['city'],
      addressUrl: json['addressUrl'],
      imagesUrl: json['images'],
      facilities: json['facilitiesID'],
      reviews: json['reviewsID'],
    );
  }
  Map<String, dynamic> topMap() {
    return {
      'name': name,
      'description': description,
      'city': city,
      'addressUrl': addressUrl,
      'images': imagesUrl,
      'facilities': facilities,
      'reviews': reviews,
    };
  }
}
