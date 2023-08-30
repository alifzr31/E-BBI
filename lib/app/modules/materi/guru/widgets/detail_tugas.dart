import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/guru/components/detail_tugas/body_detailtugas.dart';
import 'package:elearning/app/modules/materi/guru/components/detail_tugas/header_detailtugas.dart';
import 'package:flutter/material.dart';

class DetailTugasGuru extends StatelessWidget {
  const DetailTugasGuru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderDetailTugas(),
          BodyDetailTugas(),
        ],
      ),
    );
  }
}
