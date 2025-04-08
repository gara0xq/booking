import 'package:flutter/material.dart';
import 'package:main_app/core/widgets/change_lange_button.dart';
import 'package:main_app/core/widgets/login_button.dart';
import 'package:main_app/core/widgets/signin_button.dart';

import '../utils/colors.dart';

AppBar CustomAppBar(width, {onChangeLang, onLogin, onSignIn}) {
  return AppBar(
    backgroundColor: black,
    toolbarHeight: 100,
    automaticallyImplyLeading: false,
    actions: [
      // for mobile view
      if (width < 800)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
        ),

      // for desktop view
      if (width >= 800) ChangeLangeButton(onTap: onChangeLang),
      if (width >= 800) SizedBox(width: 30),
      if (width >= 800) SigninButton(onTap: onSignIn),
      if (width >= 800) SizedBox(width: 30),
      if (width >= 800) LoginButton(onTap: onLogin),
      SizedBox(width: 30),
    ],
    leading: Center(
      child: Container(
        height: 60,
        width: 60,
        color: white,
      ),
    ),
    leadingWidth: 140,
  );
}
