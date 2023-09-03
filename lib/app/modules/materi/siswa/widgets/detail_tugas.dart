import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/siswa/components/detail_tugas/body_detailtugas.dart';
import 'package:elearning/app/modules/materi/siswa/components/detail_tugas/header_detailtugas.dart';
import 'package:flutter/material.dart';

class DetailTugasSiswa extends StatelessWidget {
  const DetailTugasSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderDetailTugasSiswa(),
          const BodyDetailTugasSiswa(),
        ],
      ),
    );
  }
}