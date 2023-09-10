import 'package:elearning/app/components/base_cardcontent.dart';
import 'package:elearning/app/components/base_nodata.dart';
import 'package:elearning/app/components/base_refresh.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:elearning/app/modules/materi/guru/widgets/detail_materiguru.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListMateriSiswa extends StatefulWidget {
  const ListMateriSiswa({super.key});

  @override
  State<ListMateriSiswa> createState() => _ListMateriSiswaState();
}

class _ListMateriSiswaState extends State<ListMateriSiswa> {
  final controller = Get.find<MateriController>();

  @override
  void initState() {
    controller.fetchMateriSiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.materiSiswaLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.materiSiswa.isEmpty
              ? BaseNoData(
                  label: 'Belum ada materi',
                  onPressed: () async {
                    await controller.fetchMateriSiswa();
                    await controller.fetchOneLicon();
                  },
                )
              : BaseRefresh(
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 2500),
                        () {
                      controller.fetchMateriSiswa();
                      controller.fetchOneLicon();
                    });
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    itemCount: controller.materiSiswa.length,
                    itemBuilder: (context, index) {
                      final materiSiswa = controller.materiSiswa[index];
                      final formatter = DateFormat('E, dd MMMM yyyy');
                      final date = formatter
                          .format(materiSiswa.createdAt ?? DateTime(0000));

                      return BaseCardContent(
                        author: controller.namaGuru.value,
                        date: date,
                        title: materiSiswa.judul ?? '',
                        subtitle: materiSiswa.subjudul ?? '',
                        onPressed: () {
                          controller.idMateri.value = materiSiswa.id.toString();
                          Get.bottomSheet(
                            backgroundColor: const Color(0xFFFFFBFF),
                            const DetailMateriGuru(),
                          );
                        },
                      );
                    },
                  ),
                ),
    );
  }
}
