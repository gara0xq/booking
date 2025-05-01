import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class FilterDropDown extends StatelessWidget {
  String initialItem = "Top Picks";
  final List<String> items = [
    'Price (lowest first)',
    'Price (highest first)',
    'Top Rated',
    'Top Picks',
  ];
  FilterDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 40,
      child: CustomDropdown<String>(
        hintText: initialItem,
        items: items,
        initialItem: initialItem,
        onChanged: (value) {
          // initialItem = "$value";
        },
        closedHeaderPadding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),

        // overlayHeight: 100,
        decoration: CustomDropdownDecoration(
          headerStyle: TextStyle(
            fontSize: 14,
            color: black,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(Icons.sort),
          closedBorder: Border.all(color: black),
          closedBorderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
