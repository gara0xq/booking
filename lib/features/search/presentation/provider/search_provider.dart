import 'dart:developer';
import 'package:get/get.dart';
import '../../../../core/entity/filter_entity.dart';
import '../../../home/presentation/provider/home_provider.dart';
import '../../domain/entity/room_entity.dart';
import '../../domain/usecase/filter_hotels_usecase.dart';
import '../../domain/usecase/filter_rooms_usecase.dart';
import '../../domain/usecase/get_hotels_usecase.dart';
import '../../data/repo_impl/search_repo_impl.dart';
import '../../domain/entity/hotel_entity.dart';
import '../../domain/usecase/get_rooms_usecase.dart';

class SearchProvider extends GetxController {
  final GetHotelsUsecase _getHotelsUsecase;
  final FilterHotelsUsecase _filterHotelsUsecase;
  final GetRoomsUsecase _getRoomsUsecase;
  final FilterRoomsUsecase _filterRoomsUsecase;
  FilterEntity filterEntity;

  SearchProvider()
      : _getHotelsUsecase = GetHotelsUsecase(SearchRepoImpl()),
        _filterHotelsUsecase = FilterHotelsUsecase(SearchRepoImpl()),
        _getRoomsUsecase = GetRoomsUsecase(SearchRepoImpl()),
        _filterRoomsUsecase = FilterRoomsUsecase(SearchRepoImpl()),
        filterEntity = Get.find<HomeProvider>().filteration;

  RxList<HotelEntity> hotels = <HotelEntity>[].obs;
  RxList<RoomEntity> rooms = <RoomEntity>[].obs;
  RxBool isLoadong = true.obs;
  RxBool isRoom = false.obs;
  int numOfDays = 0;

  @override
  void onInit() async {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    Future.wait([
      _getHotelsUsecase.call().then((e) => hotels.value = e),
      _getRoomsUsecase.call().then((e) => rooms.value = e),
    ]).then((e) {
      isLoadong.value = false;
      update();
    });

    if (filterEntity.checkInDate != null) {
      numOfDays = filterEntity.checkOutDate!
          .difference(filterEntity.checkInDate!)
          .inDays;
      if (numOfDays > 0) {
        isRoom.value = true;
      } else {
        isRoom.value = false;
      }
    } else {
      isRoom.value = false;
    }
  }

  void reload() {
    checkIsRooms();
    hotels.value = _filterHotelsUsecase.call(filterEntity);
    rooms.value = _filterRoomsUsecase.call(
        (filterEntity.noOfAdults + filterEntity.noOfChildren),
        filterEntity.country);
  }

  checkIsRooms() {
    if (filterEntity.checkInDate != null) {
      numOfDays = filterEntity.checkOutDate!
          .difference(filterEntity.checkInDate!)
          .inDays;
      if (numOfDays > 0) {
        isRoom.value = true;
      } else {
        isRoom.value = false;
      }
    } else {
      isRoom.value = false;
    }
    log(isRoom.toString());
    update();
  }
}
