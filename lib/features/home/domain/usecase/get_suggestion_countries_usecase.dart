import '../repo/home_repo.dart';

class GetSuggestionCountriesUsecase {
  final HomeRepo _homeRepo;
  GetSuggestionCountriesUsecase(this._homeRepo);
  Future<List<Map<String, dynamic>>> call() async {
    return await _homeRepo.getSuggestionCountries();
  }
}
