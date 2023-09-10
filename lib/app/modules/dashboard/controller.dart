import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elearning/app/core/values/show_snackbars.dart';
import 'package:elearning/app/data/models/materi_home.dart' as mh;
import 'package:elearning/app/data/models/matpel.dart';
import 'package:elearning/app/data/models/matpel_guru.dart';
import 'package:elearning/app/data/models/profile_guru.dart';
import 'package:elearning/app/data/models/profile_siswa.dart';
import 'package:elearning/app/data/models/tugas-home.dart' as th;
import 'package:elearning/app/data/providers/dashboard_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  final DashboardProvider dashboardProvider;

  DashboardController({required this.dashboardProvider});

  final currentIndex = 0.obs;
  final role = ''.obs;

  final tugas = <th.TugasHome>[].obs;
  final materi = <mh.MateriHome>[].obs;
  final homeLoading = true.obs;

  final profileSiswa = Rx<ProfileSiswa?>(null);
  final profileGuru = Rx<ProfileGuru?>(null);

  final matpel = <Matpel>[].obs;
  final matpelGuru = <MatpelGuru>[].obs;
  final matpelLoading = true.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    role.value = sharedPreferences.getString('role') ?? '';

    fetchHomeDashboard();
    fetchProfile();
    fetchListMatpel();
    super.onInit();
  }

  @override
  void onClose() {
    tugas.clear();
    materi.clear();
    matpel.clear();
    super.onClose();
  }

  Future<void> fetchHomeDashboard() async {
    try {
      final response = await dashboardProvider.fetchHomeDashboard();
      if (role.value == 'siswa') {
        final List<th.TugasHome> bodyTugas = response.data['tugas'] == null
            ? []
            : th.listTugasHomeFromJson(jsonEncode(response.data['tugas']));
        final List<mh.MateriHome> bodyMateri = response.data['materi'] == null
            ? []
            : mh.listMateriHomeFromJson(jsonEncode(response.data['materi']));

        tugas.value = bodyTugas;
        materi.value = bodyMateri;
      } else {
        final List<th.TugasHome> bodyTugas = response.data['tugas'] == null
            ? []
            : th.listTugasHomeFromJson(jsonEncode(response.data['tugas']));
        final List<mh.MateriHome> bodyMateri = response.data['materi'] == null
            ? []
            : mh.listMateriHomeFromJson(jsonEncode(response.data['materi']));

        tugas.value = bodyTugas;
        materi.value = bodyMateri;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Home Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Fetching Home Gagal', e.response?.data.toString() ?? '');
      }
    } finally {
      homeLoading.value = false;
      update();
    }
  }

  Future<void> fetchProfile() async {
    try {
      final response = await dashboardProvider.fetchProfile();
      if (role.value == 'siswa') {
        profileSiswa.value =
            profileSiswaFromJson(jsonEncode(response.data['data']));
      } else {
        profileGuru.value =
            profileGuruFromJson(jsonEncode(response.data['data']));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Profile Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Profile Failed', e.response?.data.toString() ?? '');
      }
    } finally {
      update();
    }
  }

  Future<void> fetchListMatpel() async {
    try {
      final response = await dashboardProvider.fetchListMatpel();

      if (role.value == 'siswa') {
        final List<Matpel> body = response.data['data'] == null
            ? []
            : listMatpelFromJson(jsonEncode(response.data['data']));

        matpel.value = body;
      } else {
        final List<MatpelGuru> body = response.data['data'] == null
            ? []
            : listMatpelGuruFromJson(jsonEncode(response.data['data']));

        matpelGuru.value = body;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Pelajaran Saya Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Pelajaran Saya Gagal', e.response?.data.toString() ?? '');
      }
    } finally {
      matpelLoading.value = false;
      update();
    }
  }
}
