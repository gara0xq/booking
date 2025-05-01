import '../../../../core/entity/filter_entity.dart';
import '../entity/hotel_entity.dart';
import '../entity/room_entity.dart';

abstract class SearchRepo {
  Future<Map<String, dynamic>> getFilter();
  Future<List<HotelEntity>> getHotels();
  List<HotelEntity> filterHotels(FilterEntity filteration);
  Future<List<RoomEntity>> getRooms();
  List<RoomEntity> filterRooms(int numberOfPersons, String country);
}
