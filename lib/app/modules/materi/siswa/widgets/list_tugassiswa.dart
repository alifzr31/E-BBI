import 'package:elearning/app/components/base_cardcontent.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListTugasSiswa extends StatefulWidget {
  const ListTugasSiswa({super.key});

  @override
  State<ListTugasSiswa> createState() => _ListTugasSiswaState();
}

class _ListTugasSiswaState extends State<ListTugasSiswa> {
  final controller = Get.find<MateriController>();

  @override
  void initState() {
    controller.fetchTugasSiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.tugasLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: controller.tugas.length,
              itemBuilder: (context, index) {
                final tugas = controller.tugas[index];
                final formatter = DateFormat('E, dd MMMM yyyy');
                final startDate = formatter.format(tugas.startDate ?? DateTime(0000));
                final endDate = formatter.format(tugas.endDate ?? DateTime(0000));

                return BaseCardContent(
                  author: controller.namaGuru.value,
                  date: '$startDate - $endDate',
                  title: tugas.judul ?? '',
                  subtitle: tugas.subjudul ?? '',
                  onPressed: () {
                    controller.idTugas.value = tugas.id.toString();
                    Get.toNamed('/detailtugassiswa');
                  },
                );
              },
            ),
    );
  }
}
