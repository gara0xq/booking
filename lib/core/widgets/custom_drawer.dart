import 'package:flutter/material.dart';
import '../utils/colors.dart';

import '../utils/secrets.dart';
import 'change_lange_button.dart';
import 'login_button.dart';
import 'signin_button.dart';

class CustomDrawer extends StatelessWidget {
  final void Function()? onChangeLang;
  final void Function()? onLogin;
  final void Function()? onSignIn;
  const CustomDrawer({
    super.key,
    this.onChangeLang,
    this.onLogin,
    this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        width: 500,
        color: black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            if (Secrets.userId.isEmpty) SigninButton(onTap: onSignIn),
            if (Secrets.userId.isEmpty) LoginButton(onTap: onLogin),
            if (Secrets.userId.isNotEmpty)
              Container(
                width: 150,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: primary,
                      ),
                      icon: Icon(
                        Icons.person,
                        color: white,
                      ),
                    ),
                    Text(
                      "Geust User",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: black),
                    ),
                  ],
                ),
              ),
            ChangeLangeButton(onTap: onChangeLang),
          ],
        ),
      ),
    );
  }
}
