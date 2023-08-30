import 'dart:convert';
import 'dart:io';

import 'package:elearning/app/core/values/show_loading.dart';
import 'package:elearning/app/core/values/show_snackbars.dart';
import 'package:elearning/app/data/models/materi.dart';
import 'package:elearning/app/data/models/tugas.dart';
import 'package:elearning/app/data/models/tugas_siswa.dart';
import 'package:elearning/app/data/providers/materi_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

class MateriController extends GetxController {
  final MateriProvider materiProvider;

  MateriController({required this.materiProvider});

  final role = ''.obs;
  final materiGuru = <Materi>[].obs;
  final materiGuruLoading = true.obs;
  final id = ''.obs;
  final namaMatpel = ''.obs;
  final kelas = ''.obs;

  final detailMateri = Rx<Materi?>(null);
  final detailMateriLoading = false.obs;
  final idMateri = ''.obs;

  final tugas = <Tugas>[].obs;
  final tugasLoading = true.obs;

  final idTugas = ''.obs;
  final detailTugas = Rx<Tugas?>(null);
  final tugasSiswa = <TugasSiswa>[].obs;
  final detailTugasLoading = false.obs;

  final formKeyTambahMateriGuru = GlobalKey<FormState>().obs;
  final judulTambahController = TextEditingController().obs;
  final subjudulTambahController = TextEditingController().obs;
  final deskripsiTambahController = TextEditingController().obs;
  final fileMateriTambahController = TextEditingController().obs;
  final fileMateriTambah = Rx<File?>(null);

  final formKeyEditMateriGuru = GlobalKey<FormState>().obs;
  final judulController = TextEditingController().obs;
  final subjudulController = TextEditingController().obs;
  final deskripsiController = TextEditingController().obs;
  final fileMateriController = TextEditingController().obs;
  final fileMateri = Rx<File?>(null);

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    role.value = sharedPreferences.getString('role') ?? '';

    fetchTugas();
    fetchMateriGuru();
    // fetchDetailTugasGuru();
    super.onInit();
  }

  @override
  void onClose() {
    materiGuru.clear();
    tugas.clear();
    judulTambahController.value.dispose();
    subjudulTambahController.value.dispose();
    deskripsiTambahController.value.dispose();
    fileMateriTambahController.value.dispose();
    judulController.value.dispose();
    subjudulController.value.dispose();
    deskripsiController.value.dispose();
    fileMateriController.value.dispose();
    super.onClose();
  }

  Future<void> fetchMateriGuru() async {
    try {
      final response = await materiProvider.fetchMateriGuru(id.value);
      namaMatpel.value = response.data['data']['matpel']['nama_matpel'];
      kelas.value =
          '${response.data['data']['kelas']['kls_angka']}${response.data['data']['kelas']['kls_huruf']}';

      final List<Materi> body = response.data['data']['materi'] == null
          ? []
          : listMateriFromJson(jsonEncode(response.data['data']['materi']));

      materiGuru.value = body;
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Materi Guru Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Materi Guru Failed', e.response?.data.toString() ?? '');
      }
    } finally {
      materiGuruLoading.value = false;
      update();
    }
  }

  Future<void> fetchDetailMateri() async {
    detailMateriLoading.value = true;
    try {
      final response = await materiProvider.fetchDetailMateri(idMateri.value);
      detailMateri.value = materiFromJson(jsonEncode(response.data['data']));
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Detail Materi Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Detail Materi Failed', e.response?.data.toString() ?? '');
      }
    } finally {
      detailMateriLoading.value = false;
      update();
    }
  }

  void storeMateriGuru(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'guru_matpel_id': id.value,
      'judul': judulTambahController.value.text,
      'subjudul': subjudulTambahController.value.text,
      'deskripsi': deskripsiTambahController.value.text,
      'file_materi': fileMateriTambah.value?.path == null
          ? null
          : await dio.MultipartFile.fromFile(fileMateriTambah.value!.path),
    });

    showLoading(context);

    try {
      final response = await materiProvider.storeMateriGuru(formData);

      successSnackbar('Tambah Materi Berhasil', response.data['msg']);
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Tambah Materi Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Tambah Materi Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  void editMateriGuru(BuildContext context, idMateri) async {
    var formData;
    if (fileMateri.value?.path == null) {
      formData = dio.FormData.fromMap({
        'judul': judulController.value.text,
        'subjudul': subjudulController.value.text,
        'deskripsi': deskripsiController.value.text,
      });
    } else {
      formData = dio.FormData.fromMap({
        'judul': judulController.value.text,
        'subjudul': subjudulController.value.text,
        'deskripsi': deskripsiController.value.text,
        'file_materi': fileMateri.value?.path == null
            ? null
            : await dio.MultipartFile.fromFile(fileMateri.value!.path),
      });
    }

    showLoading(context);

    try {
      final response = await materiProvider.editMateriGuru(idMateri, formData);

      successSnackbar('Edit Materi Berhasil', response.data['msg']);
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Edit Materi Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Edit Materi Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  Future<void> fetchTugas() async {
    try {
      final response = await materiProvider.fetchTugas(id.value);
      final List<Tugas> body = response.data['data'] == null
          ? []
          : listTugasFromJson(jsonEncode(response.data['data']));

      tugas.value = body;
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Tugas Guru Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Tugas Guru Failed', e.response?.data.toString() ?? '');
      }
    } finally {
      tugasLoading.value = false;
      update();
    }
  }

  Future<void> fetchDetailTugasGuru() async {
    detailTugasLoading.value = true;
    try {
      final response = await materiProvider.fetchDetailTugas(idTugas.value);

      detailTugas.value = tugasFromJson(jsonEncode(response.data['data']));
      final List<TugasSiswa> body = response.data['data']['tugassiswa'] == null
          ? []
          : listTugasSiswaFromJson(
              jsonEncode(response.data['data']['tugassiswa']));
      tugasSiswa.value = body;
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Detail Tugas Guru Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Detail Tugas Guru Failed', e.response?.data.toString() ?? '');
      }
    } finally {
      detailTugasLoading.value = false;
      update();
    }
  }
}
