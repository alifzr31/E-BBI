import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/auth/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: Image.asset('assets/images/logo.png').image,
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFBFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BaseText(
                      text: 'Log In',
                      size: 26,
                      bold: FontWeight.w600,
                    ),
                    const SizedBox(height: 5),
                    BaseText(
                      text:
                          'Silahkan masuk menggunakan username dan password anda',
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(height: 10),
                    LoginForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
