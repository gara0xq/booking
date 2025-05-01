class HotelEntity {
  final String addressUrl;
  final String city;
  final String description;
  final String name;
  final List imagesUrl;
  final List facilities;
  final List reviews;

  HotelEntity({
    required this.name,
    required this.description,
    required this.city,
    required this.addressUrl,
    required this.imagesUrl,
    required this.facilities,
    required this.reviews,
  });
}
