// packages

import 'package:get/get.dart';

//files
import '../../data/repo_impl/home_repo_impl.dart';
import '../../domain/usecase/get_filteration_usecase.dart';
import '../../domain/usecase/get_suggestion_countries_usecase.dart';
import '../../domain/usecase/get_suggestions_usecase.dart';
import '../../domain/usecase/reset_filteration_usecase.dart';
import '../../domain/usecase/set_dates_usecase.dart';
import '../../domain/usecase/set_persons_usecase.dart';
import '../../domain/usecase/set_query_usecase.dart';
import '../../../../core/entity/filter_entity.dart';

class HomeProvider extends GetxController {
  final GetFilterationUsecase _getFilterationUsecase;
  final GetSuggestionsUsecase _getSuggestionsUsecase;
  final SetDatesUsecase _setDatesUsecase;
  final SetPersonsUsecase _setPersonsUsecase;
  final SetQueryUsecase _setQueryUsecase;
  final ResetFilterationUsecase _resetFilterationUsecase;
  final GetSuggestionCountriesUsecase _getSuggestionCountriesUsecase;

  HomeProvider()
      : _getFilterationUsecase = GetFilterationUsecase(HomeRepoImpl()),
        _getSuggestionsUsecase = GetSuggestionsUsecase(HomeRepoImpl()),
        _setDatesUsecase = SetDatesUsecase(HomeRepoImpl()),
        _setPersonsUsecase = SetPersonsUsecase(HomeRepoImpl()),
        _resetFilterationUsecase = ResetFilterationUsecase(HomeRepoImpl()),
        _setQueryUsecase = SetQueryUsecase(HomeRepoImpl()),
        _getSuggestionCountriesUsecase =
            GetSuggestionCountriesUsecase(HomeRepoImpl());

  late FilterEntity filteration;
  List<String> suggestions = [];
  List<Map<String, dynamic>> suggestionCountries = [];

  RxBool loading = true.obs;

  @override
  void onInit() async {
    resetFilteration();
    getFilteration();
    await Future.wait([
      getSuggestions(),
      getSuggestionCountries(),
    ]);
    super.onInit();
  }

  void getFilteration() {
    filteration = _getFilterationUsecase();
  }

  void resetFilteration() {
    _resetFilterationUsecase.call();
  }

  Future<void> getSuggestions() async {
    await _getSuggestionsUsecase.call().then((e) {
      suggestions = e;
    });
  }

  void setPersonsChange(int adults, int children, int rooms) {
    _setPersonsUsecase.call(adults, children, rooms);
    getFilteration();
    update();
  }

  void setCheckInOutDate(List<DateTime> dates) {
    if (dates.length == 2) {
      _setDatesUsecase.call(dates);
      getFilteration();
      // Get.back();
    }
    update();
  }

  void setQuery(String query) {
    _setQueryUsecase.call(query);
    getFilteration();
    update();
  }

  changeLang() {}

  Future<void> getSuggestionCountries() async {
    await _getSuggestionCountriesUsecase.call().then((e) {
      loading.value = false;
      suggestionCountries = e;
    });
  }
}
