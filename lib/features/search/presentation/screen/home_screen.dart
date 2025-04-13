import 'package:flutter/material.dart';

//getx
import 'package:get/get.dart';

//ui packages
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

//files
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/utils/colors.dart';
import '../provider/home_provider.dart';
import '../widget/filter_input_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool filter = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(width),
      drawer: CustomDrawer(),
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
                GetBuilder(
                    init: HomeProvider(),
                    builder: (c) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        child: Container(
                          width: width >= 800 ? width - 60 : width - 30,
                          alignment: Alignment.centerLeft,
                          height: width >= 800 ? 60 : 200,
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
                                        suggestions: c.suggestions,
                                        filteration: c.filteration,
                                        setPersonsChange:
                                            (adults, children, rooms) =>
                                                c.setPersonsChange(
                                          adults,
                                          children,
                                          rooms,
                                        ),
                                        setCheckInOutDate: (dates) =>
                                            c.setCheckInOutDate(dates),
                                        setQuery: (q) => c.setQuery(q),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: FilterInputField(
                                        inputType: InputType.calender,
                                        filteration: c.filteration,
                                        setPersonsChange:
                                            (adults, children, rooms) =>
                                                c.setPersonsChange(
                                          adults,
                                          children,
                                          rooms,
                                        ),
                                        setCheckInOutDate: (dates) =>
                                            c.setCheckInOutDate(dates),
                                        setQuery: (q) => c.setQuery(q),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: FilterInputField(
                                          inputType: InputType.persons,
                                          filteration: c.filteration,
                                          setPersonsChange:
                                              (adults, children, rooms) =>
                                                  c.setPersonsChange(
                                            adults,
                                            children,
                                            rooms,
                                          ),
                                          setCheckInOutDate: (dates) =>
                                              c.setCheckInOutDate(dates),
                                          setQuery: (q) => c.setQuery(q),
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: black,
                                            borderRadius:
                                                BorderRadius.circular(7),
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
                                        suggestions: c.suggestions,
                                        filteration: c.filteration,
                                        setPersonsChange:
                                            (adults, children, rooms) =>
                                                c.setPersonsChange(
                                          adults,
                                          children,
                                          rooms,
                                        ),
                                        setCheckInOutDate: (dates) =>
                                            c.setCheckInOutDate(dates),
                                        setQuery: (q) => c.setQuery(q),
                                      ),
                                    ),
                                    Expanded(
                                      child: FilterInputField(
                                        inputType: InputType.calender,
                                        filteration: c.filteration,
                                        setPersonsChange:
                                            (adults, children, rooms) =>
                                                c.setPersonsChange(
                                          adults,
                                          children,
                                          rooms,
                                        ),
                                        setCheckInOutDate: (dates) =>
                                            c.setCheckInOutDate(dates),
                                        setQuery: (q) => c.setQuery(q),
                                      ),
                                    ),
                                    Expanded(
                                      child: FilterInputField(
                                        inputType: InputType.persons,
                                        filteration: c.filteration,
                                        setPersonsChange:
                                            (adults, children, rooms) {
                                          // log(adults.toString());
                                          c.setPersonsChange(
                                            adults,
                                            children,
                                            rooms,
                                          );
                                        },
                                        setCheckInOutDate: (dates) =>
                                            c.setCheckInOutDate(dates),
                                        setQuery: (q) => c.setQuery(q),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: black,
                                            borderRadius:
                                                BorderRadius.circular(7),
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
                      );
                    }),
                Center(
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
