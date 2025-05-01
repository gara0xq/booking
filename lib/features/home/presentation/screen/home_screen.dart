//packages
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//files
import '../../../../core/widgets/filteration_side.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/utils/colors.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.find<HomeProvider>();
  final bool filter = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        width,
        onLogin: () => Get.rootDelegate.toNamed("/auth"),
        onSignIn: () => Get.rootDelegate.toNamed("/auth"),
        onChangeLang: () => controller.changeLang(),
      ),
      drawer: CustomDrawer(
        onLogin: () => Get.rootDelegate.toNamed("/auth"),
        onSignIn: () => Get.rootDelegate.toNamed("/auth"),
        onChangeLang: () => controller.changeLang(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: black,
              alignment: Alignment.center,
              child: Container(
                width: width >= 800 ? width - 60 : width - 30,
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Find your next stay",
                      minFontSize: 28,
                      maxFontSize: 64,
                      style: TextStyle(
                        color: white,
                        fontSize: width / 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    AutoSizeText(
                      "Search low prices on hotels, homes and much more...",
                      minFontSize: 10,
                      maxFontSize: 18,
                      style: TextStyle(
                        color: white,
                        fontSize: width / 100,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: width >= 800 ? 60 : 130,
                  color: black,
                ),
                GetBuilder<HomeProvider>(builder: (c) {
                  return FilterationSide(
                    width: width,
                    c: c,
                    onSearch: () => Get.rootDelegate.toNamed('/search'),
                  );
                }),
                Obx(() {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(top: width >= 800 ? 120 : 240),
                      width: width >= 800 ? width - 60 : width,
                      constraints: BoxConstraints(maxWidth: 1200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          Padding(
                            padding: width >= 800
                                ? EdgeInsets.zero
                                : EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Most Viewed",
                              style: TextStyle(
                                color: black,
                                fontSize: width >= 800 ? 32 : 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width >= 800 ? 500 : 300,
                            child: controller.loading.value
                                ? Center(child: CircularProgressIndicator())
                                : width >= 800
                                    ? Row(
                                        spacing: 10,
                                        children: [
                                          Expanded(
                                            child: imageBox(
                                              controller.suggestionCountries[0]
                                                  ["imageUrl"],
                                              controller.suggestionCountries[0]
                                                  ["name"],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              spacing: 10,
                                              children: [
                                                Expanded(
                                                  child: imageBox(
                                                    controller
                                                            .suggestionCountries[
                                                        1]["imageUrl"],
                                                    controller
                                                            .suggestionCountries[
                                                        1]["name"],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    spacing: 10,
                                                    children: [
                                                      Expanded(
                                                        child: imageBox(
                                                          controller
                                                                  .suggestionCountries[
                                                              3]["imageUrl"],
                                                          controller
                                                                  .suggestionCountries[
                                                              3]["name"],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: imageBox(
                                                          controller
                                                                  .suggestionCountries[
                                                              2]["imageUrl"],
                                                          controller
                                                                  .suggestionCountries[
                                                              2]["name"],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : CarouselSlider.builder(
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          height: double.infinity,
                                        ),
                                        itemCount: 4,
                                        itemBuilder: (_, i, __) => Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                controller
                                                        .suggestionCountries[i]
                                                    ["imageUrl"],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              padding: EdgeInsets.all(7),
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.black.withAlpha(130),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                controller
                                                        .suggestionCountries[i]
                                                    ["name"],
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
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

  Widget imageBox(String imageUrl, String name) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(130),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            name,
            style: TextStyle(
              color: white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
