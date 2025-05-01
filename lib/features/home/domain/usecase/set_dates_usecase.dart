import '../repo/home_repo.dart';

class SetDatesUsecase {
  final HomeRepo _homeRepo;
  SetDatesUsecase(this._homeRepo);
  void call(List<DateTime> dates) {
    _homeRepo.setCheckInOutDate(dates);
  }
}
