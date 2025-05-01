import 'package:flutter/material.dart';
import 'package:main_app/features/home/presentation/provider/home_provider.dart';

import 'filter_input_field.dart';
import '../utils/colors.dart';

class FilterationSide extends StatelessWidget {
  final double width;
  final HomeProvider c;
  final VoidCallback onSearch;
  const FilterationSide(
      {super.key,
      required this.width,
      required this.c,
      required this.onSearch});

  @override
  Widget build(BuildContext context) {
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
                      setPersonsChange: (adults, children, rooms) =>
                          c.setPersonsChange(
                        adults,
                        children,
                        rooms,
                      ),
                      setCheckInOutDate: (dates) => c.setCheckInOutDate(dates),
                      setQuery: (q) => c.setQuery(q),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: FilterInputField(
                      inputType: InputType.calender,
                      filteration: c.filteration,
                      setPersonsChange: (adults, children, rooms) =>
                          c.setPersonsChange(
                        adults,
                        children,
                        rooms,
                      ),
                      setCheckInOutDate: (dates) => c.setCheckInOutDate(dates),
                      setQuery: (q) => c.setQuery(q),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: FilterInputField(
                        inputType: InputType.persons,
                        filteration: c.filteration,
                        setPersonsChange: (adults, children, rooms) =>
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
                      onTap: onSearch,
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
                      suggestions: c.suggestions,
                      filteration: c.filteration,
                      setPersonsChange: (adults, children, rooms) =>
                          c.setPersonsChange(
                        adults,
                        children,
                        rooms,
                      ),
                      setCheckInOutDate: (dates) => c.setCheckInOutDate(dates),
                      setQuery: (q) => c.setQuery(q),
                    ),
                  ),
                  Expanded(
                    child: FilterInputField(
                      inputType: InputType.calender,
                      filteration: c.filteration,
                      setPersonsChange: (adults, children, rooms) =>
                          c.setPersonsChange(
                        adults,
                        children,
                        rooms,
                      ),
                      setCheckInOutDate: (dates) => c.setCheckInOutDate(dates),
                      setQuery: (q) => c.setQuery(q),
                    ),
                  ),
                  Expanded(
                    child: FilterInputField(
                      inputType: InputType.persons,
                      filteration: c.filteration,
                      setPersonsChange: (adults, children, rooms) {
                        // log(adults.toString());
                        c.setPersonsChange(
                          adults,
                          children,
                          rooms,
                        );
                      },
                      setCheckInOutDate: (dates) => c.setCheckInOutDate(dates),
                      setQuery: (q) => c.setQuery(q),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onSearch,
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
    );
  }
}
