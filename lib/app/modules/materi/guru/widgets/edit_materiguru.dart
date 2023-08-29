import 'dart:io';

import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/components/base_headerpage.dart';
import 'package:elearning/app/components/base_textarea.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/data/models/materi.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMateriGuru extends StatefulWidget {
  const EditMateriGuru({super.key});

  @override
  State<EditMateriGuru> createState() => _EditMateriGuruState();
}

class _EditMateriGuruState extends State<EditMateriGuru> {
  final controller = Get.find<MateriController>();
  Materi? materi;

  @override
  void initState() {
    materi = Get.arguments;
    controller.judulController.value.text = materi?.judul ?? '';
    controller.subjudulController.value.text = materi?.subjudul ?? '';
    controller.deskripsiController.value.text = materi?.deskripsi ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          BaseHeaderPage(
            title: 'Edit Materi',
            subtitle: 'Edit ${materi?.judul}',
          ),
          Obx(
            () => BaseBodyPage(
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: controller.formKeyEditMateriGuru.value,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        children: [
                          BaseFormField(
                            label: 'Judul',
                            controller: controller.judulController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan isi judul materi';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          BaseFormField(
                            label: 'Subjudul',
                            controller: controller.subjudulController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan isi subjudul materi';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          BaseTextArea(
                            label: 'Deskripsi',
                            controller: controller.deskripsiController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan isi deskripsi materi';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          BaseFormField(
                            label: 'File Materi',
                            controller: controller.fileMateriController.value,
                            readOnly: true,
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                                  'pdf',
                                  'docx',
                                  'doc',
                                  'pptx',
                                  'ppt',
                                ],
                              );
                              controller.fileMateri.value =
                                  File(result?.files.single.path ?? '');

                              String getFileNameFromFile(File file) {
                                String filePath = file.path;
                                List<String> pathSegments = filePath.split('/');
                                return pathSegments.last;
                              }

                              controller.fileMateriController.value.text =
                                  getFileNameFromFile(
                                      controller.fileMateri.value ?? File(''));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: BaseButton(
                      bgColor: baseColor,
                      fgColor: Colors.white,
                      label: 'Edit Materi',
                      onPressed: () {
                        if (controller.formKeyEditMateriGuru.value.currentState!
                            .validate()) {
                          controller.editMateriGuru(
                            context,
                            materi?.id,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
