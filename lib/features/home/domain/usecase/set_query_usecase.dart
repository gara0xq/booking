import '../repo/home_repo.dart';

class SetQueryUsecase {
  final HomeRepo _homeRepo;

  SetQueryUsecase(this._homeRepo);

  void call(String query) {
    _homeRepo.setQuery(query);
  }
}
