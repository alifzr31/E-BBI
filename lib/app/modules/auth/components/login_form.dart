import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/auth/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: controller.formKey.value,
                child: Column(
                  children: [
                    BaseFormField(
                      label: 'Username',
                      controller: controller.usernameController.value,
                      suffixIcon: const Icon(HeroIcons.user_circle),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi username anda';
                        }
        
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    BaseFormField(
                      label: 'Password',
                      controller: controller.passwordController.value,
                      obscureText: controller.showPass.value,
                      suffixIcon: IconButton(
                        onPressed: () => controller.showPass.value =
                            !controller.showPass.value,
                        icon: Icon(controller.showPass.isTrue
                            ? HeroIcons.eye
                            : HeroIcons.eye_slash),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi password anda';
                        }
        
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: baseColor,
                fgColor: Colors.white,
                label: 'Log In',
                onPressed: () {
                  if (controller.formKey.value.currentState!.validate()) {
                    controller.login(context);
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
