import 'package:elearning/app/components/base_cardcontent.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: 20,
        itemBuilder: (context, index) {
          return BaseCardContent(
            author: 'Nama Guru',
            date: '01 Januari 2023',
            title: 'Judul',
            subtitle: 'Subjudul',
            onPressed: () {},
          );
        },
      ),
    );
  }
}
