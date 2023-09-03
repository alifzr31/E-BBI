import 'package:elearning/app/components/base_headerpage.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/guru/components/tambah_tugas/form_tambahtugas.dart';
import 'package:flutter/material.dart';

class TambahTugasGuruPage extends StatelessWidget {
  const TambahTugasGuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          const BaseHeaderPage(
            title: 'Tambah Tugas',
            subtitle: 'Tambah tugas untuk di publikasi',
          ),
          FormTambahTugas(),
        ],
      ),
    );
  }
}
