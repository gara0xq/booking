import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onTap;
  const LoginButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(7),
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
    );
  }
}
