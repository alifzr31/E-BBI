import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderMyLesson extends StatelessWidget {
  HeaderMyLesson({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                text: 'Pelajaran Saya',
                size: 24,
                bold: FontWeight.bold,
              ),
              if (controller.role.value == 'siswa')
                BaseText(
                  text:
                      'Di kelas ${controller.profileSiswa.value?.kelas?.klsAngka}${controller.profileSiswa.value?.kelas?.klsHuruf}',
                  color: Colors.grey.shade600,
                  bold: FontWeight.w600,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
