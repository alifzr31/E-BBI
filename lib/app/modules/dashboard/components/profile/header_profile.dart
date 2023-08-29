import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HeaderProfile extends StatelessWidget {
  HeaderProfile({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        color: Colors.transparent,
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: const Icon(
                  HeroIcons.user,
                  size: 60,
                  color: baseColor,
                ),
              ),
              const SizedBox(height: 10),
              BaseText(
                text: controller.role.value == 'siswa'
                    ? controller.profileSiswa.value?.nama ?? ''
                    : controller.profileGuru.value?.nama ?? '',
                textAlign: TextAlign.center,
                color: Colors.white,
                size: 18,
                bold: FontWeight.bold,
              ),
              BaseText(
                text: '(${controller.role.value.capitalize})',
                textAlign: TextAlign.center,
                color: Colors.white,
                size: 16,
                bold: FontWeight.w600,
              ),
              TextButton.icon(
                onPressed: () {
                  Get.toNamed('/editprofile');
                },
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                  iconSize: MaterialStatePropertyAll(16),
                ),
                icon: const Icon(EvaIcons.edit),
                label: const BaseText(text: 'Edit Profil'),
              ),
              const SizedBox(height: 10),
              controller.role.value == 'siswa' ? siswa() : guru(),
            ],
          ),
        ),
      ),
    );
  }

  Widget siswa() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                text: 'No. Induk Siswa',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileSiswa.value?.nis ?? '',
                color: Colors.white,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 5),
              const BaseText(
                text: 'No. Telepon',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileSiswa.value?.noTelp ?? '',
                color: Colors.white,
                bold: FontWeight.w600,
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BaseText(
                text: 'Jenis Kelamin',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileSiswa.value?.jk.toString().capitalize ??
                    '',
                textAlign: TextAlign.end,
                color: Colors.white,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 5),
              const BaseText(
                text: 'Alamat',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileSiswa.value?.alamat ?? '',
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                bold: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget guru() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                text: 'No. Induk Siswa',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileGuru.value?.nip ?? '',
                color: Colors.white,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 5),
              const BaseText(
                text: 'No. Telepon',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileGuru.value?.noTelp ?? '',
                color: Colors.white,
                bold: FontWeight.w600,
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BaseText(
                text: 'Jenis Kelamin',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileGuru.value?.jk.toString().capitalize ??
                    '',
                textAlign: TextAlign.end,
                color: Colors.white,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 5),
              const BaseText(
                text: 'Alamat',
                color: Colors.white,
              ),
              BaseText(
                text: controller.profileGuru.value?.alamat ?? '',
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                bold: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
