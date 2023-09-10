import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/siswa/widgets/list_materisiswa.dart';
import 'package:elearning/app/modules/materi/siswa/widgets/list_tugassiswa.dart';
import 'package:flutter/material.dart';

class BodyMateriTugasSiswa extends StatefulWidget {
  const BodyMateriTugasSiswa({super.key});

  @override
  State<BodyMateriTugasSiswa> createState() => _BodyMateriTugasSiswaState();
}

class _BodyMateriTugasSiswaState extends State<BodyMateriTugasSiswa>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
      child: Column(
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
              children: const [
                ListMateriSiswa(),
                ListTugasSiswa(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
