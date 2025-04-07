import 'dart:developer';

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
                shadow: [],
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                bodyBuilder: (context) => Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: -2,
                        blurRadius: 10,
                      )
                    ],
                  ),
                ),
                onPop: () => log('Popover was popped!'),
                direction: PopoverDirection.bottom,
                arrowHeight: 10,
                arrowWidth: 20,
              );
            },
            child: Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: white,
              ),
              child: Row(
                children: [
                  Icon(Icons.person, color: black),
                  Spacer(),
                  Text(
                    "Adult 2 | Children 0",
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

class UserTile extends StatelessWidget {
  final String user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user),
    );
  }
}
