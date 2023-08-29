import 'package:elearning/app/components/base_cardcontent.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListTugasGuru extends StatefulWidget {
  const ListTugasGuru({super.key});

  @override
  State<ListTugasGuru> createState() => _ListTugasGuruState();
}

class _ListTugasGuruState extends State<ListTugasGuru> {
  final controller = Get.find<MateriController>();

  @override
  void initState() {
    controller.fetchTugas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.tugasLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              itemCount: controller.tugas.length,
              itemBuilder: (context, index) {
                final tugas = controller.tugas[index];
                final formatter = DateFormat('dd MMMM yyyy HH:mm');
                final startDate =
                    formatter.format(tugas.startDate ?? DateTime(0000));
                final endDate =
                    formatter.format(tugas.endDate ?? DateTime(0000));

                return BaseCardContent(
                  author: tugas.siswa?.nama ?? '',
                  date: '$startDate - $endDate',
                  title: tugas.judul ?? '',
                  subtitle: tugas.subjudul ?? '',
                  onPressed: () {},
                );
              },
            ),
    );
  }
}
