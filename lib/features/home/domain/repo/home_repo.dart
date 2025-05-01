import '../../../../core/entity/filter_entity.dart';

abstract class HomeRepo {
  void setPersonsChange(int adults, int children, int rooms);
  void setCheckInOutDate(List<DateTime> dates);
  void setQuery(String query);
  FilterEntity getFilteration();
  Future<List<String>> getSuggestions();
  void resetFilteration();
  Future<List<Map<String, dynamic>>> getSuggestionCountries();
}
