import 'package:elearning/app/core/values/show_loading.dart';
import 'package:elearning/app/core/values/show_snackbars.dart';
import 'package:elearning/app/data/providers/profile_provider.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final ProfileProvider profileProvider;

  ProfileController({required this.profileProvider});

  final formKey = GlobalKey<FormState>().obs;
  final namaController = TextEditingController().obs;
  final alamatController = TextEditingController().obs;
  final noTelpController = TextEditingController().obs;
  final jkController = TextEditingController().obs;

  final formKeyChangePassword = GlobalKey<FormState>().obs;
  final currentPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final showPassCurrent = true.obs;
  final showPassNew = true.obs;
  final showPassConfirm = true.obs;
  final currentPassword = ''.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    currentPassword.value = sharedPreferences.getString('password') ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    namaController.value.dispose();
    alamatController.value.dispose();
    noTelpController.value.dispose();
    jkController.value.dispose();
    currentPasswordController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }

  void editProfile(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'nama': namaController.value.text,
      'alamat': alamatController.value.text,
      'no_telp': noTelpController.value.text,
      'jk': jkController.value.text,
    });

    showLoading(context);
    print(formData.fields);
    final userController = Get.find<DashboardController>();

    try {
      final response = await profileProvider.editProfile(formData);

      successSnackbar('Edit Profil Berhasil', response.data['msg']);
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Edit Profil Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Edit Profil Gagal', e.response?.data['msg'] ?? '');
      }
    } finally {
      userController.fetchProfile();
    }
  }

  void changePassword(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'current_password': currentPasswordController.value.text,
      'new_password': newPasswordController.value.text,
      'new_password_confirmation': confirmPasswordController.value.text,
    });

    showLoading(context);

    try {
      final response = await profileProvider.changePassword(formData);

      successSnackbar('Ubah Password Berhasil', response.data['msg']);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.clear();
      sharedPreferences.setBool('isOpened', true);
      Get.offAllNamed('/auth');
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ubah Password Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Ubah Password Gagal', e.response?.data.toString() ?? '');
      }
    }
  }
}
