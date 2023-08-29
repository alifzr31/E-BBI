import 'package:elearning/app/core/values/colors.dart';
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
      () => SizedBox(
        height: 180,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: baseColor,
                  height: 135,
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.role.value == 'siswa'
                                    ? controller.profileSiswa.value?.nama ?? ''
                                    : controller.profileGuru.value?.nama ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              controller.role.value == 'siswa'
                                  ? Text(
                                      'Kelas ${controller.profileSiswa.value?.kelas?.klsAngka}${controller.profileSiswa.value?.kelas?.klsHuruf}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      controller.profileGuru.value?.nip ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
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
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 90,
              child: Center(
                child: Container(
                  height: 80,
                  width: Get.width * 80 / 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey.shade400,
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Tugas'),
                            const SizedBox(height: 5),
                            Text(
                              '1',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('data'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
