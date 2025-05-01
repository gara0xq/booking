import '../../domain/entity/facility_entity.dart';

class FacilityModel extends FacilityEntity {
  FacilityModel({
    required super.name,
    required super.description,
  });
  factory FacilityModel.fromMap(Map<String, dynamic> json) {
    return FacilityModel(
      name: json['name'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }
}
