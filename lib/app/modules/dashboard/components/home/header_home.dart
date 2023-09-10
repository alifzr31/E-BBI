import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HeaderHome extends StatelessWidget {
  HeaderHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: controller.role.value == 'siswa'
                          ? controller.profileSiswa.value?.nama ?? ''
                          : controller.profileGuru.value?.nama ?? '',
                      color: Colors.white,
                      size: 16,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: controller.role.value == 'siswa'
                          ? 'Kelas ${controller.profileSiswa.value?.kelas?.klsAngka}${controller.profileSiswa.value?.kelas?.klsHuruf}'
                          : controller.profileGuru.value?.nip ?? '',
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 23,
                child: const Icon(HeroIcons.user),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
