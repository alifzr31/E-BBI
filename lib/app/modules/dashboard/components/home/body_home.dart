import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_cardcontent.dart';
import 'package:elearning/app/components/base_nodata.dart';
import 'package:elearning/app/components/base_refresh.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/data/providers/materi_provider.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:elearning/app/modules/materi/guru/widgets/detail_materiguru.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<DashboardController>();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    controller.fetchHomeDashboard();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBodyPage(
      child: Obx(
        () => controller.homeLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  TabBar(
                    labelPadding: const EdgeInsets.all(15),
                    dividerColor: Colors.transparent,
                    indicatorColor: baseColor.withOpacity(0.99),
                    controller: tabController,
                    tabs: const [
                      BaseText(text: 'Materi'),
                      BaseText(text: 'Tugas'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        controller.materi.isEmpty
                            ? BaseNoData(
                                label: 'Belum ada materi',
                                onPressed: () {
                                  controller.fetchHomeDashboard();
                                },
                              )
                            : controller.role.value == 'siswa'
                                ? materiSiswa()
                                : materiGuru(),
                        controller.materi.isEmpty
                            ? BaseNoData(
                                label: 'Belum ada tugas',
                                onPressed: () {
                                  controller.fetchHomeDashboard();
                                },
                              )
                            : controller.role.value == 'siswa'
                                ? tugasSiswa()
                                : tugasGuru(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget materiSiswa() {
    return BaseRefresh(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          controller.fetchHomeDashboard();
        });
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: controller.materi.length,
        itemBuilder: (context, index) {
          final materi = controller.materi[index];
          final formatter = DateFormat('E, dd MMMM yyyy');
          final date = formatter.format(materi.createdAt ?? DateTime(0000));

          return BaseCardContent(
            author: materi.gurumatpel?.guru?.nama ?? '',
            date: date,
            title: materi.gurumatpel?.matpel?.namaMatpel ?? '',
            subtitle: materi.judul ?? '',
            onPressed: () {
              final materiController =
                  Get.put(MateriController(materiProvider: MateriProvider()));
              materiController.idMateri.value = materi.id.toString();
              Get.bottomSheet(
                backgroundColor: const Color(0xFFFFFBFF),
                const DetailMateriGuru(),
              );
            },
          );
        },
      ),
    );
  }

  Widget materiGuru() {
    return BaseRefresh(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          controller.fetchHomeDashboard();
        });
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: controller.materi.length,
        itemBuilder: (context, index) {
          final materi = controller.materi[index];
          final formatter = DateFormat('E, dd MMMM yyyy');
          final date = formatter.format(materi.createdAt ?? DateTime(0000));

          return BaseCardContent(
            author: controller.profileGuru.value?.nama ?? '',
            date: date,
            title: materi.gurumatpel?.matpel?.namaMatpel ?? '',
            subtitle: materi.judul ?? '',
            onPressed: () {
              final materiController =
                  Get.put(MateriController(materiProvider: MateriProvider()));
              materiController.idMateri.value = materi.id.toString();
              Get.bottomSheet(
                backgroundColor: const Color(0xFFFFFBFF),
                const DetailMateriGuru(),
              );
            },
          );
        },
      ),
    );
  }

  Widget tugasSiswa() {
    return BaseRefresh(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          controller.fetchHomeDashboard();
        });
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: controller.tugas.length,
        itemBuilder: (context, index) {
          final tugas = controller.tugas[index];
          final formatter = DateFormat('E, dd MMMM yyyy');
          final date = formatter.format(tugas.createdAt ?? DateTime(0000));

          return BaseCardContent(
            author: tugas.gurumatpel?.guru?.nama ?? '',
            date: date,
            title: tugas.gurumatpel?.matpel?.namaMatpel ?? '',
            subtitle: tugas.judul ?? '',
            onPressed: () {
              final materiController =
                  Get.put(MateriController(materiProvider: MateriProvider()));
              materiController.idTugas.value = tugas.id.toString();
              Get.toNamed('/detailtugassiswa');
            },
          );
        },
      ),
    );
  }

  Widget tugasGuru() {
    return BaseRefresh(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          controller.fetchHomeDashboard();
        });
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: controller.tugas.length,
        itemBuilder: (context, index) {
          final tugas = controller.tugas[index];
          final formatter = DateFormat('E, dd MMMM yyyy');
          final date = formatter.format(tugas.createdAt ?? DateTime(0000));

          return BaseCardContent(
            author: controller.profileGuru.value?.nama ?? '',
            date: date,
            title: tugas.gurumatpel?.matpel?.namaMatpel ?? '',
            subtitle: tugas.judul ?? '',
            onPressed: () {
              final materiController =
                  Get.put(MateriController(materiProvider: MateriProvider()));
              materiController.idTugas.value = tugas.id.toString();
              Get.toNamed('/detailtugasguru');
            },
          );
        },
      ),
    );
  }
}
