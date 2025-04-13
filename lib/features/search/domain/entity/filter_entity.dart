class FilterEntity {
  String country;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int noOfAdults;
  int noOfChildren;
  int noOfRooms;

  FilterEntity({
    required this.country,
    required this.checkInDate,
    required this.checkOutDate,
    required this.noOfAdults,
    required this.noOfChildren,
    required this.noOfRooms,
  });
}
