import 'dart:async';

import 'package:elearning/app/components/base_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), navigator);
    super.initState();
  }

  void navigator() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    final isOpened = sharedPreferences.getBool('isOpened');

    if (isOpened == true) {
      if (token == null) {
        Get.offAllNamed('/auth');
      } else {
        Get.offAllNamed('/dashboard');
      }
    } else {
      Get.offAllNamed('/onboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BaseText(
                  text: 'E-Learning',
                  size: 24,
                  bold: FontWeight.w600,
                ),
                const BaseText(
                  text: 'SLB Negeri A Bandung',
                  size: 26,
                  bold: FontWeight.bold,
                ),
                const SizedBox(height: 40),
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 300,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 100,
            right: 0,
            left: 0,
            child: Center(child: CupertinoActivityIndicator()),
          ),
        ],
      ),
    );
  }
}
