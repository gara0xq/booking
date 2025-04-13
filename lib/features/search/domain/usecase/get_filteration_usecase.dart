import '../repo/home_repo.dart';
import '../entity/filter_entity.dart';

class GetFilterationUsecase {
  final HomeRepo _homeRepo;
  GetFilterationUsecase(this._homeRepo);
  FilterEntity call() {
    return _homeRepo.getFilteration();
  }
}
