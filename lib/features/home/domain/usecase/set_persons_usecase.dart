import '../repo/home_repo.dart';

class SetPersonsUsecase {
  final HomeRepo _homeRepo;

  SetPersonsUsecase(this._homeRepo);

  void call(int adults, int children, int rooms) {
    _homeRepo.setPersonsChange(adults, children, rooms);
  }
}
