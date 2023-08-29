import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_dropdown.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/components/base_textarea.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:elearning/app/modules/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormEditProfile extends StatelessWidget {
  FormEditProfile({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (userController.role.value == 'siswa') {
          controller.namaController.value.text =
              userController.profileSiswa.value?.nama ?? '';
          controller.alamatController.value.text =
              userController.profileSiswa.value?.alamat ?? '';
          controller.noTelpController.value.text =
              userController.profileSiswa.value?.noTelp ?? '';
          controller.jkController.value.text =
              userController.profileSiswa.value?.jk ?? '';
        } else {
          controller.namaController.value.text =
              userController.profileGuru.value?.nama ?? '';
          controller.alamatController.value.text =
              userController.profileGuru.value?.alamat ?? '';
          controller.noTelpController.value.text =
              userController.profileGuru.value?.noTelp ?? '';
          controller.jkController.value.text =
              userController.profileGuru.value?.jk ?? '';
        }

        return Expanded(
          child: Container(
            width: Get.width,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFBFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: controller.formKey.value,
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      children: [
                        BaseFormField(
                          label: 'Nama Lengkap',
                          controller: controller.namaController.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Silahkan isi nama lengkap anda';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        BaseTextArea(
                          label: 'Alamat',
                          controller: controller.alamatController.value,
                          maxLines: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Silahkan isi alamat anda';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        BaseFormField(
                          label: 'No. Telpon',
                          controller: controller.noTelpController.value,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Silahkan isi no. telepon anda';
                            } else {
                              if (value.length < 12 || value.length > 15) {
                                return 'No. telepon harus antara 12 digit sampai 15 digit';
                              }
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        BaseDropdown(
                          value: controller.jkController.value.text == ''
                              ? null
                              : controller.jkController.value.text,
                          items: [
                            DropdownMenuItem(
                              value: 'laki-laki',
                              child: const BaseText(text: 'Laki-laki'),
                            ),
                            DropdownMenuItem(
                              value: 'perempuan',
                              child: const BaseText(text: 'Perempuan'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.jkController.value.text =
                                value.toString();
                          },
                          validator: 'Silahkan pilih jenis kelamin anda',
                          label: 'Jenis Kelamin',
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: BaseButton(
                    bgColor: baseColor,
                    fgColor: Colors.white,
                    label: 'Edit Profil',
                    onPressed: () {
                      if (controller.formKey.value.currentState!.validate()) {
                        controller.editProfile(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
