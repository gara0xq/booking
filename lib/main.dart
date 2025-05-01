import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/binding.dart';
import 'core/utils/secrets.dart';
import 'features/search/presentation/screen/search_screen.dart';
import 'firebase_options.dart';
import 'features/auth/presentation/screen/auth_screen.dart';
import 'features/home/presentation/screen/home_screen.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();

  Secrets.userId = prefs.getString("uid") ?? "";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouterDelegate(),
      defaultTransition: Transition.fade,
      initialBinding: Binding(),
      getPages: [
        GetPage(name: "/", page: () => HomeScreen(), binding: Binding()),
        GetPage(name: "/auth", page: () => AuthScreen()),
        GetPage(name: "/search", page: () => SearchScreen()),
      ],
    );
  }
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute("/")!.currentPage!],
    );
  }
}
