import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/modules/auth/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/login.svg',
                      width: 300,
                    ),
                  ),
                ),
              ),
              Container(
                height: 360,
                width: Get.width,
                color: const Color(0xFFFAFAFA),
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
