import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/search/presentation/screen/home_screen.dart';

void main() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const HomeScreen()),
      ],
    );
  }
}
