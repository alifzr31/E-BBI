import 'package:elearning/app/components/base_nodata.dart';
import 'package:elearning/app/components/base_refresh.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/data/providers/materi_provider.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyMyLesson extends StatelessWidget {
  BodyMyLesson({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.matpelLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.role.value == 'siswa'
                ? controller.matpel.isEmpty
                    ? BaseNoData(
                        label: 'Belum ada mata pelajaran',
                        onPressed: () {
                          controller.fetchListMatpel();
                        },
                      )
                    : siswa()
                : controller.matpelGuru.isEmpty
                    ? BaseNoData(
                        label: 'Belum ada mata pelajaran',
                        onPressed: () {
                          controller.fetchListMatpel();
                        },
                      )
                    : guru(),
      ),
    );
  }

  Widget siswa() {
    return BaseRefresh(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          controller.fetchListMatpel();
        });
      },
      child: ListView.builder(
        itemCount: controller.matpel.length,
        itemBuilder: (context, index) {
          final matpel = controller.matpel[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: BaseText(
              text: matpel.matpel?.namaMatpel ?? '',
              bold: FontWeight.bold,
            ),
            subtitle: BaseText(
              text:
                  'Kelas ${controller.profileSiswa.value?.kelas?.klsAngka}${controller.profileSiswa.value?.kelas?.klsHuruf}',
              bold: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              final materiController =
                  Get.put(MateriController(materiProvider: MateriProvider()));
              materiController.id.value = matpel.id.toString();
              Get.toNamed('/materitugassiswa');
            },
          );
        },
      ),
    );
  }

  Widget guru() {
    return BaseRefresh(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          controller.fetchListMatpel();
        });
      },
      child: ListView.builder(
        itemCount: controller.matpelGuru.length,
        itemBuilder: (context, index) {
          final matpelGuru = controller.matpelGuru[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: BaseText(
              text: matpelGuru.matpel?.namaMatpel ?? '',
              bold: FontWeight.bold,
            ),
            subtitle: BaseText(
              text:
                  'Kelas ${matpelGuru.kelas?.klsAngka}${matpelGuru.kelas?.klsHuruf}',
              bold: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              final materiController =
                  Get.put(MateriController(materiProvider: MateriProvider()));
              materiController.id.value = matpelGuru.id.toString();
              Get.toNamed(
                '/materiguru',
                arguments: controller.profileGuru.value?.nama,
              );
            },
          );
        },
      ),
    );
  }
}
