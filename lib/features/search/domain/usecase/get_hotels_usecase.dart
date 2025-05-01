import '../repo/search_repo.dart';
import '../entity/hotel_entity.dart';

class GetHotelsUsecase {
  final SearchRepo _searchRepo;
  GetHotelsUsecase(this._searchRepo);

  Future<List<HotelEntity>> call() async {
    return await _searchRepo.getHotels();
  }
}
