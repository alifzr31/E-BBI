import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class DetailMateriGuru extends StatefulWidget {
  const DetailMateriGuru({super.key});

  @override
  State<DetailMateriGuru> createState() => _DetailMateriGuruState();
}

class _DetailMateriGuruState extends State<DetailMateriGuru> {
  final controller = Get.find<MateriController>();

  @override
  void initState() {
    controller.fetchDetailMateri();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final formatter = DateFormat('dd MMMM yyyy');
      final date = formatter
          .format(controller.detailMateri.value?.createdAt ?? DateTime(0000));

      return SizedBox(
        width: Get.width,
        height: 300,
        child: controller.detailMateriLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BaseText(
                                text:
                                    controller.detailMateri.value?.judul ?? '',
                                size: 16,
                                bold: FontWeight.bold,
                              ),
                              BaseText(
                                text: controller.detailMateri.value?.subjudul ??
                                    '',
                                size: 12,
                                color: Colors.grey.shade600,
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
                        const SizedBox(width: 10),
                        if (DateTime.now()
                            .isBefore(controller.detailMateri.value!.createdAt!) && controller.role.value == 'guru')
                          TextButton.icon(
                            onPressed: () {
                              Get.toNamed(
                                '/editmateriguru',
                                arguments: controller.detailMateri.value,
                              );
                            },
                            icon: const Icon(Iconsax.edit_2, size: 18),
                            label: const BaseText(
                              text: 'Edit',
                              size: 15,
                              bold: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.downloadMateri(controller.detailMateri.value?.fileMateri);
                            },
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: BaseText(
                                      text: controller
                                              .detailMateri.value?.fileMateri ??
                                          '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Logo(
                                  //   Logos.microsoft_word,
                                  //   size: 25,
                                  // ),
                                  const Icon(
                                    Iconsax.document_download,
                                    color: baseColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: BaseText(
                                  text: controller
                                          .detailMateri.value?.deskripsi ??
                                      '',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
