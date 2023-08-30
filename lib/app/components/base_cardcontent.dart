import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class BaseCardContent extends StatelessWidget {
  const BaseCardContent({
    Key? key,
    required this.author,
    required this.date,
    required this.title,
    required this.subtitle,
    this.onPressed,
  }) : super(key: key);

  final String author;
  final String date;
  final String title;
  final String subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: const Icon(
                    HeroIcons.user,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: author,
                        bold: FontWeight.w600,
                      ),
                      BaseText(
                        text: date,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: BaseText(
                text: title,
                size: 16,
                bold: FontWeight.bold,
                textAlign: TextAlign.justify,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: BaseText(
                text: subtitle,
                textAlign: TextAlign.justify,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              width: Get.width,
              child: BaseButton(
                bgColor: baseColor,
                fgColor: Colors.white,
                label: 'Lihat Detail',
                onPressed: onPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BaseCardTugasSiswa extends StatelessWidget {
  const BaseCardTugasSiswa({
    Key? key,
    required this.author,
    required this.date,
    required this.fileName,
    required this.btnText,
    this.onTapFile,
    this.onPressed,
  }) : super(key: key);

  final String author;
  final String date;
  final String fileName;
  final String btnText;
  final void Function()? onTapFile;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: const Icon(
                    HeroIcons.user,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: author,
                        bold: FontWeight.w600,
                      ),
                      BaseText(
                        text: date,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: onTapFile,
              child: Container(
                width: Get.width,
                color: Colors.grey.withOpacity(0.3),
                padding: const EdgeInsets.all(10),
                child: BaseText(text: fileName),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              width: Get.width,
              child: BaseButton(
                bgColor: baseColor,
                fgColor: Colors.white,
                label: btnText,
                onPressed: onPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}
