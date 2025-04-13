import 'package:main_app/features/search/domain/repo/home_repo.dart';

class ResetFilterationUsecase {
  final HomeRepo _homeRepo;
  ResetFilterationUsecase(this._homeRepo);
  void call() {
    _homeRepo.resetFilteration();
  }
}
