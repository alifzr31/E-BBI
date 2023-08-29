import 'package:elearning/app/components/base_headerpage.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HeaderMateriGuru extends StatelessWidget {
  HeaderMateriGuru({super.key});
  final controller = Get.find<MateriController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseHeaderActionPage(
        title: controller.namaMatpel.value,
        subtitle: controller.kelas.value,
        actionWidget: Row(
          children: [
            IconButton(
              onPressed: () {},
              color: Colors.white,
              tooltip: 'Mulai live conference',
              icon: const Icon(HeroIcons.video_camera),
            ),
            PopupMenuButton(
              color: const Color(0xFFF9F1F9),
              tooltip: 'Menu lainnya',
              icon: const Icon(HeroIcons.document_plus),
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (value) {
                if (value == 'tambahmateri') {
                  Get.toNamed('/tambahmateriguru');
                } else {
                  // Get.toNamed('/tambahtugasguru');
                  print(value);
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<String>(
                    value: 'tambahmateri',
                    child: BaseText(text: 'Tambah Materi'),
                  ),
                  PopupMenuItem<String>(
                    value: 'tambahtugas',
                    child: BaseText(text: 'Tambah Tugas'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}
