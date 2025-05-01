import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/filteration_side.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/utils/colors.dart';
import '../../../home/presentation/provider/home_provider.dart';
import '../provider/search_provider.dart';
import '../widget/filter_drop_down.dart';
import '../widget/hotel_card.dart';
import '../widget/room_card.dart';

class SearchScreen extends StatelessWidget {
  final homeController = Get.find<HomeProvider>();
  final searchController = Get.put(SearchProvider());

  final containerKey = GlobalKey();
  OptionItem value = OptionItem(
    id: "1",
    title: "Top reviewed",
    data: "Top reviewed",
  );

  Map<String, List<String>> filters = {
    "Property type": ["Hotel", "Hostel", "Apartment", "Villa"],
    "Facilities": ["Free Wi-Fi", "Swimming Pool", "Parking", "Restaurant"],
    "Property rating": ["5 stars", "4 stars", "3 stars", "2 stars", "1 star"],
  };
  List<String> filtersName = ["Property type", "Facilities", "Property rating"];
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        width,
        onLogin: () => Get.rootDelegate.toNamed("/auth"),
        onSignIn: () => Get.rootDelegate.toNamed("/auth"),
        onChangeLang: () => homeController.changeLang(),
      ),
      drawer: CustomDrawer(
        onLogin: () => Get.rootDelegate.toNamed("/auth"),
        onSignIn: () => Get.rootDelegate.toNamed("/auth"),
        onChangeLang: () => homeController.changeLang(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: width >= 800 ? 60 : 130,
                  color: black,
                ),
                GetBuilder<HomeProvider>(
                  builder: (c) {
                    return FilterationSide(
                      width: width,
                      c: c,
                      onSearch: () => searchController.reload(),
                    );
                  },
                ),
                Obx(() {
                  return Center(
                    child: Container(
                      key: containerKey,
                      margin: EdgeInsets.only(top: width >= 800 ? 120 : 240),
                      width: width >= 800 ? width - 60 : width,
                      constraints: BoxConstraints(maxWidth: 1200),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          if (width >= 1000)
                            Expanded(
                              child: Container(
                                // height: 500,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: secondary.withAlpha(50),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: black),
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: filtersName.length,
                                  separatorBuilder: (_, i) {
                                    return Divider(
                                      color: black,
                                      thickness: 2,
                                      height: 30,
                                    );
                                  },
                                  itemBuilder: (_, i) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          filtersName[i],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              filters[filtersName[i]]!.length,
                                          itemBuilder: (_, j) {
                                            return Row(
                                              children: [
                                                Checkbox(
                                                  value: false,
                                                  onChanged: (e) {},
                                                ),
                                                Text(
                                                  filters[filtersName[i]]![j],
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    spacing: 10,
                                    children: [
                                      FilterDropDown(),
                                      if (width < 1000)
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 34,
                                            width: 34,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: black),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.filter_alt),
                                          ),
                                        ),
                                      Spacer(),
                                      Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "(168) Hotel found",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  searchController.isLoadong.value
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : searchController.isRoom.value
                                          ? ListView.builder(
                                              itemCount:
                                                  searchController.rooms.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (_, i) {
                                                final item =
                                                    searchController.rooms[i];
                                                return RoomCard(
                                                  width: width,
                                                  imageUrl:
                                                      item.hotel.imagesUrl[0],
                                                  name: item.name,
                                                  description: item.description,
                                                  price: item.price *
                                                      searchController
                                                          .numOfDays,
                                                );
                                              },
                                            )
                                          : ListView.builder(
                                              itemCount: searchController
                                                  .hotels.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (_, i) {
                                                final item =
                                                    searchController.hotels[i];
                                                return HotelCard(
                                                  width: width,
                                                  imageUrl: item.imagesUrl[0],
                                                  name: item.name,
                                                  description: item.description,
                                                );
                                              },
                                            ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
