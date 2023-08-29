import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/guru/widgets/list_materiguru.dart';
import 'package:elearning/app/modules/materi/guru/widgets/list_tugasguru.dart';
import 'package:flutter/material.dart';

class BodyMateriGuru extends StatefulWidget {
  const BodyMateriGuru({super.key});

  @override
  State<BodyMateriGuru> createState() => _BodyMateriGuruState();
}

class _BodyMateriGuruState extends State<BodyMateriGuru>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
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
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                ListMateriGuru(),
                ListTugasGuru(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
