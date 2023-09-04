import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/guru/components/body_materiguru.dart';
import 'package:elearning/app/modules/materi/guru/components/header_materitugasguru.dart';
import 'package:flutter/material.dart';

class MateriGuruPage extends StatelessWidget {
  const MateriGuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderMateriGuru(),
          BodyMateriGuru(),
        ],
      ),
    );
  }
}
