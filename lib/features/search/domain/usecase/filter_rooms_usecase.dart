import '../entity/room_entity.dart';
import '../repo/search_repo.dart';

class FilterRoomsUsecase {
  final SearchRepo _searchRepo;

  FilterRoomsUsecase(this._searchRepo);

  List<RoomEntity> call(int numberOfPersons, String country) {
    return _searchRepo.filterRooms(numberOfPersons, country);
  }
}
