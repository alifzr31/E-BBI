import 'package:dio/dio.dart' as dio;
import 'package:elearning/app/core/values/show_loading.dart';
import 'package:elearning/app/core/values/show_snackbars.dart';
import 'package:elearning/app/data/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final formKey = GlobalKey<FormState>().obs;
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final showPass = true.obs;

  void login(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'username': usernameController.value.text,
      'password': passwordController.value.text,
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    showLoading(context);

    try {
      final response = await authProvider.login(formData);
      sharedPreferences.setString('token', response.data['token']);
      sharedPreferences.setInt('siswa_id', response.data['user']['id']);
      sharedPreferences.setInt('user_id', response.data['user']['user']['id']);
      sharedPreferences.setString(
          'role', response.data['user']['user']['role']);
      sharedPreferences.setString('password', passwordController.value.text);

      successSnackbar('Log In Berhasil', response.data['msg']);
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Log In Gagal', e.response?.data.toString() ?? '');
      } else if (e.response?.statusCode == 401) {
        infoSnackbar('Log In Gagal', e.response?.data['msg']);
      } else {
        infoSnackbar('Log In Gagal', e.response?.data.toString() ?? '');
      }
    }
  }
}
