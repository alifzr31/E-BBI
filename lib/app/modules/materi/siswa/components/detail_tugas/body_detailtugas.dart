import 'dart:io';

import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class BodyDetailTugasSiswa extends StatefulWidget {
  const BodyDetailTugasSiswa({super.key});

  @override
  State<BodyDetailTugasSiswa> createState() => _BodyDetailTugasSiswaState();
}

class _BodyDetailTugasSiswaState extends State<BodyDetailTugasSiswa>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.find<MateriController>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    controller.fetchDetailTugasSiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBodyPage(
      child: Obx(
        () {
          final formatter = DateFormat('E, dd MMMM yyyy');
          final startDate = formatter.format(
              controller.detailTugas.value?.startDate ?? DateTime(0000));
          final endDate = formatter
              .format(controller.detailTugas.value?.endDate ?? DateTime(0000));

          return controller.detailTugasLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    TabBar(
                      labelPadding: const EdgeInsets.all(15),
                      dividerColor: Colors.transparent,
                      indicatorColor: baseColor.withOpacity(0.99),
                      controller: tabController,
                      tabs: const [
                        BaseText(text: 'Detail Tugas'),
                        BaseText(text: 'Pengumpulan Tugas'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: BaseText(
                                    text: '$startDate - $endDate',
                                    color: DateTime.now().isAfter(controller
                                                    .detailTugas
                                                    .value
                                                    ?.endDate ??
                                                DateTime(0000)) &&
                                            controller.detailTugasSiswa.value ==
                                                null
                                        ? Colors.red
                                        : null,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: Get.width,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: BaseText(
                                            text: controller.detailTugas.value
                                                    ?.fileTugas ??
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
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: BaseText(
                                    text: controller
                                            .detailTugas.value?.deskripsi ??
                                        '',
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // PENGUMPULAN TUGAS
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: controller.detailTugasSiswa.value == null
                                ? Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            if (DateTime.now().isAfter(
                                                controller.detailTugas.value
                                                        ?.endDate ??
                                                    DateTime(0000)))
                                              Container(
                                                width: Get.width,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      EvaIcons.alert_triangle,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 5),
                                                    BaseText(
                                                      text:
                                                          'Batas waktu pengumpulan sudah lewat',
                                                      color: Colors.white,
                                                      bold: FontWeight.w600,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            else
                                              Container(
                                                width: Get.width,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.lightBlue
                                                      .withOpacity(0.65),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      EvaIcons.info,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    BaseText(
                                                      text:
                                                          'Belum Mengumpulkan',
                                                      color: Colors.white,
                                                      bold: FontWeight.w600,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Expanded(
                                              child: Form(
                                                child: ListView(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  children: [
                                                    BaseFormField(
                                                      controller: controller
                                                          .fileTugasSiswaController
                                                          .value,
                                                      label: 'File Tugas Anda',
                                                      readOnly: true,
                                                      onTap: () async {
                                                        FilePickerResult?
                                                            result =
                                                            await FilePicker
                                                                .platform
                                                                .pickFiles(
                                                          type: FileType.custom,
                                                          allowedExtensions: [
                                                            'pdf',
                                                            'docx',
                                                            'doc',
                                                            'pptx',
                                                            'ppt',
                                                          ],
                                                        );
                                                        controller
                                                            .fileTugasSiswa
                                                            .value = File(result
                                                                ?.files
                                                                .single
                                                                .path ??
                                                            '');

                                                        String
                                                            getFileNameFromFile(
                                                                File file) {
                                                          String filePath =
                                                              file.path;
                                                          List<String>
                                                              pathSegments =
                                                              filePath
                                                                  .split('/');
                                                          return pathSegments
                                                              .last;
                                                        }

                                                        controller
                                                                .fileTugasSiswaController
                                                                .value
                                                                .text =
                                                            getFileNameFromFile(
                                                                controller
                                                                        .fileTugasSiswa
                                                                        .value ??
                                                                    File(''));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: Get.width,
                                        child: BaseButton(
                                          bgColor: baseColor,
                                          fgColor: Colors.white,
                                          label: 'Kumpulkan Tugas',
                                          onPressed: () {
                                            controller.storeTugasSiswa(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: BaseText(
                                          text: controller.detailTugasSiswa
                                                      .value?.status ==
                                                  'ontime'
                                              ? 'Tepat Waktu'
                                              : 'Terlambat',
                                          color: controller.detailTugasSiswa
                                                      .value?.status ==
                                                  'ontime'
                                              ? Colors.green
                                              : Colors.red,
                                          bold: FontWeight.w600,
                                          size: 16,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: BaseText(
                                          text: 'Nilai : ' +
                                              (controller.detailTugasSiswa.value
                                                          ?.nilai ==
                                                      null
                                                  ? '-'
                                                  : controller.detailTugasSiswa
                                                          .value?.nilai ??
                                                      ''),
                                          bold: FontWeight.w600,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: BaseText(
                                                  text: controller
                                                          .detailTugasSiswa
                                                          .value
                                                          ?.fileTugasSiswa ??
                                                      '',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
