import 'package:flutter/material.dart';
import 'package:main_app/core/utils/colors.dart';

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
            SigninButton(onTap: onSignIn),
            LoginButton(onTap: onLogin),
            ChangeLangeButton(onTap: onChangeLang),
          ],
        ),
      ),
    );
  }
}
