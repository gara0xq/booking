import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:main_app/features/auth/presentation/provider/auth_provider.dart';
import '../../../../core/utils/colors.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final controller = Get.put(AuthProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 400,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  SvgPicture.asset(
                    "assets/logo.svg",
                    height: 150,
                    width: 150,
                    // color: ,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sign in or create an account',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'You can sign in using your account to access our services.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Email Address',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primary, width: 2),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primary, width: 2),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () => controller.authWithEmail(
                        _emailController.text, _passwordController.text),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Continue with Email",
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: secondary,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("or use ont of these options"),
                      ),
                      Expanded(
                        child: Divider(
                          color: secondary,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 30,
                    children: [
                      InkWell(
                        onTap: () => controller.loginWithGoogle(),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primary, width: 2),
                          ),
                          child: Icon(
                            Icons.g_mobiledata,
                            size: 70,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: null,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primary, width: 2),
                          ),
                          child: Icon(
                            Icons.facebook,
                            size: 60,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withAlpha(100),
                    child: Center(
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 5,
                            )
                          ],
                        ),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }
}
