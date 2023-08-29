import 'package:elearning/app/components/base_headerpage.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/guru/components/tambah_materi/form_tambahmateri.dart';
import 'package:flutter/material.dart';

class TambahMateriGuruPage extends StatelessWidget {
  const TambahMateriGuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          BaseHeaderPage(
            title: 'Tambah Materi',
            subtitle: 'Tambah materi untuk di publikasi',
          ),
          FormTambahMateri(),
        ],
      ),
    );
  }
}
