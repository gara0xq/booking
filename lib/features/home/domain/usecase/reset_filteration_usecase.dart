import '../repo/home_repo.dart';

class ResetFilterationUsecase {
  final HomeRepo _homeRepo;
  ResetFilterationUsecase(this._homeRepo);
  void call() {
    _homeRepo.resetFilteration();
  }
}
