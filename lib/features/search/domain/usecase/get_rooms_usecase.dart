import '../entity/room_entity.dart';
import '../repo/search_repo.dart';

class GetRoomsUsecase {
  final SearchRepo _searchRepo;

  GetRoomsUsecase(this._searchRepo);

  Future<List<RoomEntity>> call() async {
    return await _searchRepo.getRooms();
  }
}
