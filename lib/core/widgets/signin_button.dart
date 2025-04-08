import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SigninButton extends StatelessWidget {
  final void Function()? onTap;
  const SigninButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: secondary, width: 3),
          borderRadius: BorderRadius.circular(7),
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
    );
  }
}
