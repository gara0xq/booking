import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: black,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        actions: [
          // for mobile view
          if (width < 800)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Builder(
                builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          // for desktop view
          if (width >= 800)
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: secondary, width: 3),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "En",
                  style: TextStyle(color: white),
                ),
              ),
            ),

          if (width >= 800) SizedBox(width: 30),
          if (width >= 800)
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: secondary, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          if (width >= 800) SizedBox(width: 30),
          if (width >= 800)
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "Login",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          SizedBox(width: 30),
        ],
        leading: Center(
          child: Container(
            height: 60,
            width: 60,
            color: white,
          ),
        ),
        leadingWidth: 140,
      ),
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
                width: width - 60,
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
                    width: width - 60,
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
                    width: width - 60,
                    constraints: BoxConstraints(maxWidth: 1200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: [
                        Text(
                          "Most Viewed",
                          style: TextStyle(
                            color: black,
                            fontSize: width >= 800 ? 32 : 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: width >= 800 ? 500 : 400,
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
