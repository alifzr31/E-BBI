import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/core/values/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: const Color(0xFFFFFBFF),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: ListView(
          padding: const EdgeInsets.all(0),
          physics: const ClampingScrollPhysics(),
          children: [
            ListTile(
              leading: const Icon(
                Iconsax.key,
                color: baseColor,
              ),
              title: const BaseText(text: 'Ubah Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/changepassword');
              },
            ),
            ListTile(
              leading: const Icon(
                Bootstrap.door_open_fill,
                color: baseColor,
              ),
              title: const BaseText(text: 'Log Out'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                showLoading(context);
                await Future.delayed(const Duration(seconds: 2), () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.clear();
                  sharedPreferences.setBool('isOpened', true);
                  Get.offAllNamed('/auth');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
