import 'package:elearning/app/components/base_cardcontent.dart';
import 'package:elearning/app/components/base_nodata.dart';
import 'package:elearning/app/components/base_refresh.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:elearning/app/modules/materi/guru/widgets/detail_materiguru.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListMateriGuru extends StatefulWidget {
  const ListMateriGuru({super.key});

  @override
  State<ListMateriGuru> createState() => _ListMateriGuruState();
}

class _ListMateriGuruState extends State<ListMateriGuru> {
  final controller = Get.find<MateriController>();
  final arguments = Get.arguments;

  @override
  void initState() {
    controller.fetchMateriGuru();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.materiGuruLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.materiGuru.isEmpty
              ? BaseNoData(
                  label: 'Materi belum ada',
                  onPressed: () async {
                    await controller.fetchMateriGuru();
                    await controller.fetchOneLicon();
                  },
                )
              : BaseRefresh(
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 2500),
                        () {
                      controller.fetchMateriGuru();
                      controller.fetchOneLicon();
                    });
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                    itemCount: controller.materiGuru.length,
                    itemBuilder: (context, index) {
                      final materiGuru = controller.materiGuru[index];
                      final formatter = DateFormat('dd MMMM yyyy');
                      final date = formatter
                          .format(materiGuru.createdAt ?? DateTime(0000));

                      return BaseCardContent(
                        author: arguments,
                        date: date,
                        title: materiGuru.judul ?? '',
                        subtitle: materiGuru.subjudul ?? '',
                        onPressed: () {
                          controller.idMateri.value = materiGuru.id.toString();
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
