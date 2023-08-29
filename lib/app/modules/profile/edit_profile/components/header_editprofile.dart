import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HeaderEditProfile extends StatelessWidget {
  HeaderEditProfile({super.key});
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      padding: const EdgeInsets.all(15),
      child: SafeArea(
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              foregroundColor: baseColor,
              child: const Icon(
                HeroIcons.user,
                size: 40,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: userController.role.value == 'siswa'
                        ? userController.profileSiswa.value?.nama ?? ''
                        : userController.profileGuru.value?.nama ?? '',
                    size: 18,
                    bold: FontWeight.bold,
                    color: Colors.white,
                  ),
                  BaseText(
                    text: userController.role.value == 'siswa'
                        ? userController.profileSiswa.value?.nis ?? ''
                        : userController.profileGuru.value?.nip ?? '',
                    color: Colors.grey.shade300,
                    bold: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
