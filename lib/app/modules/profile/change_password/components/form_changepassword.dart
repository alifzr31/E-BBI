import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class FormChangePassword extends StatelessWidget {
  FormChangePassword({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseBodyPage(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: controller.formKeyChangePassword.value,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  children: [
                    BaseFormField(
                      label: 'Password',
                      controller: controller.currentPasswordController.value,
                      obscureText: controller.showPassCurrent.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.showPassCurrent.value =
                              !controller.showPassCurrent.value;
                        },
                        icon: Icon(controller.showPassCurrent.value
                            ? HeroIcons.eye
                            : HeroIcons.eye_slash),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi password anda';
                        } else {
                          if (value.length < 8) {
                            return 'Minimal password harus 8 karakter';
                          } else {
                            if (value != controller.currentPassword.value) {
                              return 'Password tidak sesuai dengan password sebelumnya';
                            }
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BaseFormField(
                      label: 'Password Baru',
                      controller: controller.newPasswordController.value,
                      obscureText: controller.showPassNew.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.showPassNew.value =
                              !controller.showPassNew.value;
                        },
                        icon: Icon(controller.showPassNew.value
                            ? HeroIcons.eye
                            : HeroIcons.eye_slash),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi password baru anda';
                        } else {
                          if (value.length < 8) {
                            return 'Minimal password harus 8 karakter';
                          } else {
                            if (value ==
                                controller
                                    .currentPasswordController.value.text) {
                              return 'Password harus beda dari password sebelumnya';
                            }
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BaseFormField(
                      label: 'Konfirmasi Password',
                      controller: controller.confirmPasswordController.value,
                      obscureText: controller.showPassConfirm.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.showPassConfirm.value =
                              !controller.showPassConfirm.value;
                        },
                        icon: Icon(controller.showPassConfirm.value
                            ? HeroIcons.eye
                            : HeroIcons.eye_slash),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi konfirmasi password anda';
                        } else {
                          if (value.length < 8) {
                            return 'Minimal password harus 8 karakter';
                          } else {
                            if (value !=
                                controller.newPasswordController.value.text) {
                              return 'Password tidak sesuai dengan password baru';
                            }
                          }
                        }

                        return null;
                      },
                    ),
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
                label: 'Ubah Password',
                onPressed: () {
                  if (controller.formKeyChangePassword.value.currentState!
                      .validate()) {
                    controller.changePassword(context);
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
