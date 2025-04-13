import '../repo/home_repo.dart';

class GetSuggestionsUsecase {
  final HomeRepo _homeRepo;
  GetSuggestionsUsecase(this._homeRepo);
  Future<List<String>> call() async {
    return await _homeRepo.getSuggestions();
  }
}
