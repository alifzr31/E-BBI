import 'package:elearning/app/components/base_headerpage.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderDetailTugasSiswa extends StatelessWidget {
  HeaderDetailTugasSiswa({super.key});
  final controller = Get.find<MateriController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseHeaderPage(
        title: controller.detailTugas.value?.judul ?? '',
        subtitle: controller.detailTugas.value?.subjudul ?? '',
      ),
    );
  }
}
