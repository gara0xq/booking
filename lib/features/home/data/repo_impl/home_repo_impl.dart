import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_app/features/home/data/source/get_suggestion_countries.dart';

import '../../../../core/entity/filter_entity.dart';
import '../../domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final GetSuggestionCountries _getSuggestionCountries;
  HomeRepoImpl()
      : _getSuggestionCountries =
            GetSuggestionCountries(FirebaseFirestore.instance);
  static final FilterEntity filteration = FilterEntity(
    country: "",
    checkInDate: null,
    checkOutDate: null,
    noOfAdults: 2,
    noOfChildren: 0,
    noOfRooms: 1,
  );

  List<String> suggestions = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Luxor',
    'Aswan',
    'Sharm El Sheikh',
    'Hurghada',
    'Dahab',
    'Marsa Alam',
    'Suez',
    'Port Said',
  ];

  @override
  void setCheckInOutDate(List<DateTime> dates) {
    filteration.checkInDate = dates[0];
    filteration.checkOutDate = dates[1];
  }

  @override
  void setPersonsChange(int adults, int children, int rooms) {
    filteration.noOfAdults = adults;
    filteration.noOfChildren = children;
    filteration.noOfRooms = rooms;
  }

  @override
  void setQuery(String query) {
    filteration.country = query;
  }

  @override
  FilterEntity getFilteration() {
    return filteration;
  }

  @override
  Future<List<String>> getSuggestions() {
    return Future.value(suggestions);
  }

  @override
  void resetFilteration() {
    filteration.country = "";
    filteration.checkInDate = null;
    filteration.checkOutDate = null;
    filteration.noOfAdults = 2;
    filteration.noOfChildren = 0;
    filteration.noOfRooms = 1;
  }

  @override
  Future<List<Map<String, dynamic>>> getSuggestionCountries() async {
    return await _getSuggestionCountries.getSuggestionCountries();
  }
}
