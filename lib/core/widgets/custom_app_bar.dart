import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../features/home/presentation/provider/home_provider.dart';
import '../utils/secrets.dart';
import 'change_lange_button.dart';
import 'login_button.dart';
import 'signin_button.dart';

import '../utils/colors.dart';

AppBar CustomAppBar(width, {onChangeLang, onLogin, onSignIn}) {
  return AppBar(
    backgroundColor: black,
    toolbarHeight: 100,
    automaticallyImplyLeading: false,
    actions: [
      // for mobile view
      GetBuilder<HomeProvider>(builder: (c) {
        return Row(
          children: [
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
            if (width >= 800 && Secrets.userId.isEmpty)
              SigninButton(onTap: onSignIn),
            if (width >= 800 && Secrets.userId.isEmpty) SizedBox(width: 30),
            if (width >= 800 && Secrets.userId.isEmpty)
              LoginButton(onTap: onLogin),
            if (width >= 800 && Secrets.userId.isNotEmpty)
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

            SizedBox(width: 30),
          ],
        );
      }),
    ],
    leading: Center(
      child: SvgPicture.asset(
        "assets/centerLogo.svg",
        height: 70,
        width: 70,
        color: white,
      ),
    ),
    leadingWidth: 140,
  );
}
