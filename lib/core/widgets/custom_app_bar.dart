import 'package:flutter/material.dart';

import '../utils/colors.dart';

AppBar CustomAppBar(width) {
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
      if (width >= 800)
        Container(
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

      if (width >= 800) SizedBox(width: 30),
      if (width >= 800)
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: secondary, width: 3),
            borderRadius: BorderRadius.circular(12),
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
      if (width >= 800) SizedBox(width: 30),
      if (width >= 800)
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.circular(12),
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
