import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';
import '../../../../core/utils/colors.dart';

enum InputType {
  search,
  calender,
  persons,
}

class FilterInputField extends StatelessWidget {
  final InputType inputType;
  final List<String>? suggestions;
  const FilterInputField(
      {super.key, this.inputType = InputType.search, this.suggestions});
  @override
  Widget build(BuildContext context) {
    return inputType == InputType.search
        ? StandardSearchBar(
            suggestions: suggestions,
            borderRadius: 7,
            suggestionsBoxHeight:
                suggestions!.length > 3 ? 180 : suggestions!.length * 60,
            startIconColor: black,
          )
        : InkWell(
            onTap: () {
              showPopover(
                context: context,
                transition: PopoverTransition.other,
                direction: PopoverDirection.bottom,
                shadow: [],
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                bodyBuilder: (context) => Container(
                  height: inputType == InputType.calender ? 420 : 220,
                  width: 300,
                  color: primary,
                  padding: EdgeInsets.all(3),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: inputType == InputType.calender
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CalendarDatePicker2(
                                config: CalendarDatePicker2Config(
                                  selectedRangeHighlightColor:
                                      secondary.withAlpha(60),
                                  selectedDayHighlightColor: secondary,
                                  calendarType: CalendarDatePicker2Type.range,
                                  firstDate: DateTime.now(),
                                ),
                                value: [],
                              ),
                              InkWell(
                                onTap: () {
                                  log("Done");
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 2, color: primary),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            spacing: 5,
                            children: [
                              _counter(name: "Adults", count: 1),
                              _counter(name: "Children", count: 1),
                              _counter(name: "Rooms", count: 1),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  log("Done");
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 2, color: primary),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        color: black,
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
                onPop: () => log('Popover was popped!'),
                // direction: PopoverDirection.right,
                arrowHeight: 10,
                arrowWidth: 20,
              );
            },
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: white,
              ),
              child: Row(
                children: [
                  Icon(
                      inputType == InputType.calender
                          ? Icons.calendar_month
                          : Icons.person,
                      color: black),
                  Spacer(),
                  Text(
                    inputType == InputType.calender
                        ? "Check in | Check out"
                        : "Adult 2 | Children 0",
                    style: TextStyle(
                      color: black.withAlpha(122),
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
  }
}

Widget _counter(
    {required String name,
    void Function()? onAdd,
    void Function()? onRemove,
    required int count}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Rooms",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Container(
        height: 35,
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: black),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onRemove,
                child: Icon(
                  Icons.remove,
                  color: primary,
                  size: 18,
                ),
              ),
            ),
            Expanded(
              child: Text(
                count.toString(),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: onAdd,
                child: Icon(
                  Icons.add,
                  color: primary,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
