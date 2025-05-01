import '../../../../core/entity/filter_entity.dart';
import '../repo/search_repo.dart';
import '../entity/hotel_entity.dart';

class FilterHotelsUsecase {
  final SearchRepo _searchRepo;
  FilterHotelsUsecase(this._searchRepo);

  List<HotelEntity> call(FilterEntity filteration) {
    return _searchRepo.filterHotels(filteration);
  }
}
