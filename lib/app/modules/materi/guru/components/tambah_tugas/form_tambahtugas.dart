import 'dart:io';

import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_datetimepicker.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/components/base_textarea.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTambahTugas extends StatelessWidget {
  FormTambahTugas({super.key});
  final controller = Get.find<MateriController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseBodyPage(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: controller.formKeyStoreTugasGuru.value,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  children: [
                    BaseFormField(
                      label: 'Judul',
                      controller: controller.judulTugasController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan masukkan judul tugas';
                        }
                        
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BaseFormField(
                      label: 'Subjudul',
                      controller: controller.subjudulTugasController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan masukkan subjudul tugas';
                        }
                        
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    BaseTextArea(
                      label: 'Deskripsi',
                      controller: controller.deskripsiTugasController.value,
                      maxLines: null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan masukkan deskripsi tugas';
                        }
                        
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BaseDateTimePicker(
                      label: 'Deadline',
                      controller: controller.endTugasController.value,
                      validator: (value) {
                        if (controller.endTugasController.value.text.isEmpty) {
                          return 'Silahkan masukkan deadline tugas';
                        }
                        
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BaseFormField(
                      label: 'File Tugas',
                      controller: controller.fileTugasController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan masukkan file tugas';
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
                        controller.fileTugas.value =
                            File(result?.files.single.path ?? '');

                        String getFileNameFromFile(File file) {
                          String filePath = file.path;
                          List<String> pathSegments = filePath.split('/');
                          return pathSegments.last;
                        }

                        controller.fileTugasController.value.text =
                            getFileNameFromFile(
                                controller.fileTugas.value ?? File(''));
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
                label: 'Tambah Tugas',
                onPressed: () {
                  if (controller.formKeyStoreTugasGuru.value.currentState!.validate()) {
                    controller.storeTugasGuru(context);
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
