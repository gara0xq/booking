import 'package:flutter/material.dart';

//getx
import 'package:get/get.dart';

//ui packages
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:popover/popover.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

//files
import '../../../../core/utils/colors.dart';
import '../../domain/entity/filter_entity.dart';
import 'counter_feild.dart';

enum InputType {
  search,
  calender,
  persons,
}

class FilterInputField extends StatefulWidget {
  void Function(int adults, int children, int rooms)? setPersonsChange;
  void Function(List<DateTime> dates)? setCheckInOutDate;
  dynamic Function(String)? setQuery;
  final InputType inputType;
  final List<String>? suggestions;
  final FilterEntity filteration;
  FilterInputField({
    super.key,
    this.inputType = InputType.search,
    this.suggestions,
    this.setPersonsChange,
    this.setCheckInOutDate,
    this.setQuery,
    required this.filteration,
  });

  @override
  State<FilterInputField> createState() => _FilterInputFieldState();
}

class _FilterInputFieldState extends State<FilterInputField> {
  @override
  Widget build(BuildContext context) {
    return widget.inputType == InputType.search
        ? StandardSearchBar(
            suggestions: widget.suggestions,
            borderRadius: 7,
            onChanged: (e) => widget.setQuery!(e),
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
                  height: widget.inputType == InputType.calender ? null : 220,
                  width: 340,
                  color: primary,
                  padding: EdgeInsets.all(3),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: widget.inputType == InputType.calender
                        ? CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              selectedRangeHighlightColor:
                                  secondary.withAlpha(60),
                              selectedDayHighlightColor: secondary,
                              calendarType: CalendarDatePicker2Type.range,
                              firstDate: DateTime.now(),
                            ),
                            onValueChanged: (value) =>
                                widget.setCheckInOutDate!(value),
                            value: [],
                          )
                        : Column(
                            spacing: 5,
                            children: [
                              Counter(
                                name: "Adults",
                                count: widget.filteration.noOfAdults,
                                onChange: (value) => setState(
                                  () => widget.setPersonsChange!(
                                    value,
                                    widget.filteration.noOfChildren,
                                    widget.filteration.noOfRooms,
                                  ),
                                ),
                              ),
                              Counter(
                                name: "Children",
                                count: widget.filteration.noOfChildren,
                                onChange: (value) => setState(
                                  () => widget.setPersonsChange!(
                                    widget.filteration.noOfAdults,
                                    value,
                                    widget.filteration.noOfRooms,
                                  ),
                                ),
                              ),
                              Counter(
                                name: "Rooms",
                                count: widget.filteration.noOfRooms,
                                onChange: (value) => setState(
                                  () => widget.setPersonsChange!(
                                    widget.filteration.noOfAdults,
                                    widget.filteration.noOfChildren,
                                    value,
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () => Get.back(),
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
                spacing: 13,
                children: [
                  Icon(
                      widget.inputType == InputType.calender
                          ? Icons.calendar_month
                          : Icons.person,
                      color: black),
                  Text(
                    widget.inputType == InputType.calender
                        ? widget.filteration.checkInDate == null
                            ? "Check in | Check out"
                            : "${widget.filteration.checkInDate?.day}-${widget.filteration.checkInDate?.month}   |   ${widget.filteration.checkOutDate?.day}-${widget.filteration.checkOutDate?.month}"
                        : "Adult ${widget.filteration.noOfAdults} | Children ${widget.filteration.noOfChildren}",
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
