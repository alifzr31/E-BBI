import 'dart:io';

import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/components/base_textarea.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTambahMateri extends StatelessWidget {
  FormTambahMateri({super.key});
  final controller = Get.find<MateriController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseBodyPage(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: controller.formKeyTambahMateriGuru.value,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  children: [
                    BaseFormField(
                      label: 'Judul',
                      controller: controller.judulTambahController.value,
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
                      controller: controller.subjudulTambahController.value,
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
                      controller: controller.deskripsiTambahController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi deskripsi materi';
                        }

                        return null;
                      },
                      maxLines: null,
                    ),
                    const SizedBox(height: 20),
                    BaseFormField(
                      label: 'File Materi',
                      controller: controller.fileMateriTambahController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi file materi';
                        }

                        return null;
                      },
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
                        controller.fileMateriTambah.value =
                            File(result?.files.single.path ?? '');

                        String getFileNameFromFile(File file) {
                          String filePath = file.path;
                          List<String> pathSegments = filePath.split('/');
                          return pathSegments.last;
                        }

                        controller.fileMateriTambahController.value.text =
                            getFileNameFromFile(
                                controller.fileMateriTambah.value ?? File(''));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: BaseButton(
                bgColor: baseColor,
                fgColor: Colors.white,
                label: 'Tambah Materi',
                onPressed: () {
                  if (controller.formKeyTambahMateriGuru.value.currentState!
                      .validate()) {
                    controller.storeMateriGuru(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
