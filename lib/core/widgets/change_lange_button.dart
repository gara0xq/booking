import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ChangeLangeButton extends StatelessWidget {
  final void Function()? onTap;
  const ChangeLangeButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
    );
  }
}
