import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:main_app/core/widgets/custom_app_bar.dart';
import 'package:main_app/features/search/presentation/widget/filter_input_field.dart';
import '../../../../core/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool filter = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(width),
      drawer: Drawer(
        child: Container(
          height: double.infinity,
          width: 500,
          color: Colors.red,
        ),
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
                      minFontSize: 34,
                      maxFontSize: 64,
                      style: TextStyle(
                        color: white,
                        fontSize: width / 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    AutoSizeText(
                      "Search low prices on hotels, homes and much more...",
                      minFontSize: 12,
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
                  height: width >= 800 ? 60 : 150,
                  color: black,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Container(
                    width: width >= 800 ? width - 60 : width - 30,
                    alignment: Alignment.centerLeft,
                    height: width >= 800 ? 60 : 240,
                    constraints: BoxConstraints(maxWidth: 1200),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: width >= 800
                        ? Row(
                            spacing: 7,
                            children: [
                              Expanded(
                                flex: 3,
                                child: FilterInputField(
                                  suggestions: [],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: FilterInputField(
                                  inputType: InputType.calender,
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: FilterInputField(
                                    inputType: InputType.persons,
                                  )),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: black,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            spacing: 7,
                            children: [
                              Expanded(
                                child: FilterInputField(
                                  suggestions: [],
                                ),
                              ),
                              Expanded(
                                child: FilterInputField(
                                  inputType: InputType.calender,
                                ),
                              ),
                              Expanded(
                                child: FilterInputField(
                                  inputType: InputType.persons,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: black,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: width >= 800 ? 120 : 280),
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
                              fontSize: width >= 800 ? 32 : 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width >= 800 ? 500 : 300,
                          child: width >= 800
                              ? Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        spacing: 10,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              spacing: 10,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.grey.shade400,
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
                                  itemCount: 3,
                                  itemBuilder: (_, i, __) => Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
