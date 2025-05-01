import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/entity/filter_entity.dart';
import '../../domain/entity/hotel_entity.dart';
import '../../domain/entity/room_entity.dart';
import '../../domain/repo/search_repo.dart';
import '../source/get_filters.dart';
import '../source/get_hotels.dart';
import '../source/get_rooms.dart';

class SearchRepoImpl implements SearchRepo {
  final GetFilters _getFiltersSource;
  final GetHotels _getHotels;
  final GetRooms _getRooms;
  static List<HotelEntity> hotels = [];
  static List<RoomEntity> rooms = [];

  SearchRepoImpl()
      : _getFiltersSource = GetFilters(FirebaseFirestore.instance),
        _getHotels = GetHotels(FirebaseFirestore.instance),
        _getRooms = GetRooms(FirebaseFirestore.instance);

  @override
  Future<Map<String, dynamic>> getFilter() async {
    return await _getFiltersSource.getFilters();
  }

  @override
  Future<List<HotelEntity>> getHotels() async {
    hotels = await _getHotels.getHotels();
    return hotels;
  }

  @override
  List<HotelEntity> filterHotels(FilterEntity filteration) {
    List<HotelEntity> filteredHotels = [];

    filteredHotels = hotels
        .where((e) =>
            e.city.toLowerCase().contains(filteration.country.toLowerCase()))
        .toList();
    return filteredHotels;
  }

  @override
  Future<List<RoomEntity>> getRooms() async {
    rooms = await _getRooms.getRooms();
    return rooms;
  }

  @override
  List<RoomEntity> filterRooms(int numberOfPersons, String country) {
    {
      List<RoomEntity> filteredRooms = [];
      filteredRooms =
          rooms.where((e) => e.numberOfPersons == numberOfPersons).toList();
      filteredRooms = filteredRooms
          .where(
              (e) => e.hotel.city.toLowerCase().contains(country.toLowerCase()))
          .toList();
      return filteredRooms;
    }
  }
}
