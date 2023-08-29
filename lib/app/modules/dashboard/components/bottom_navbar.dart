import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SalomonBottomBar(
        backgroundColor: Colors.transparent,
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.currentIndex.value = index,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(HeroIcons.home),
            title: const Text('Beranda'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(HeroIcons.newspaper),
            title: const Text('Pelajaran Saya'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(HeroIcons.user),
            title: const Text('Profil Saya'),
          ),
        ],
      ),
    );
  }
}
