import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/siswa/components/body_materitugassiswa.dart';
import 'package:elearning/app/modules/materi/siswa/components/header_materitugassiswa.dart';
import 'package:flutter/material.dart';

class MateriTugasSiswaPage extends StatelessWidget {
  const MateriTugasSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderMateriTugasSiswa(),
          const BodyMateriTugasSiswa(),
        ],
      ),
    );
  }
}