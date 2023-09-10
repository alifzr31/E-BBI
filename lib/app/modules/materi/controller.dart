import 'dart:convert';
import 'dart:io';

import 'package:elearning/app/core/utils/api_url.dart';
import 'package:elearning/app/core/values/show_loading.dart';
import 'package:elearning/app/core/values/show_snackbars.dart';
import 'package:elearning/app/data/models/licon.dart';
import 'package:elearning/app/data/models/materi.dart';
import 'package:elearning/app/data/models/tugas.dart';
import 'package:elearning/app/data/models/tugas_siswa.dart';
import 'package:elearning/app/data/providers/materi_provider.dart';
import 'package:elearning/app/modules/meeting/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

class MateriController extends GetxController {
  final MateriProvider materiProvider;

  MateriController({required this.materiProvider});

  final role = ''.obs;
  final materiGuru = <Materi>[].obs;
  final materiSiswa = <Materi>[].obs;
  final materiGuruLoading = true.obs;
  final materiSiswaLoading = true.obs;
  final id = ''.obs;
  final namaMatpel = ''.obs;
  final kelas = ''.obs;
  final namaGuru = ''.obs;
  final idKelas = Rx<int?>(null);

  final detailMateri = Rx<Materi?>(null);
  final detailMateriLoading = false.obs;
  final idMateri = ''.obs;

  final tugas = <Tugas>[].obs;
  final tugasLoading = true.obs;

  final idTugas = ''.obs;
  final detailTugas = Rx<Tugas?>(null);
  final tugasSiswa = <TugasSiswa>[].obs;
  final detailTugasLoading = false.obs;
  final detailTugasSiswa = Rx<TugasSiswa?>(null);

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

  final formKeyBeriNilai = GlobalKey<FormState>().obs;
  final nilaiController = TextEditingController().obs;

  final formKeyStoreTugasGuru = GlobalKey<FormState>().obs;
  final judulTugasController = TextEditingController().obs;
  final subjudulTugasController = TextEditingController().obs;
  final deskripsiTugasController = TextEditingController().obs;
  final endTugasController = TextEditingController().obs;
  final fileTugasController = TextEditingController().obs;
  final fileTugas = Rx<File?>(null);

  final fileTugasSiswa = Rx<File?>(null);
  final fileTugasSiswaController = TextEditingController().obs;

  final licon = Rx<Licon?>(null);
  final liconLoading = false.obs;
  final judulLiconController = TextEditingController().obs;

  final idLicon = ''.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    role.value = sharedPreferences.getString('role') ?? '';

    // if (role.value == 'siswa') {
    //   fetchMateriSiswa();
    //   fetchTugasSiswa();
    // } else {
    //   fetchTugasGuru();
    //   fetchMateriGuru();
    // }
    super.onInit();
  }

  @override
  void onClose() {
    materiGuru.clear();
    materiSiswa.clear();
    tugas.clear();
    judulTambahController.value.dispose();
    subjudulTambahController.value.dispose();
    deskripsiTambahController.value.dispose();
    fileMateriTambahController.value.dispose();
    judulController.value.dispose();
    subjudulController.value.dispose();
    deskripsiController.value.dispose();
    fileMateriController.value.dispose();
    nilaiController.value.dispose();
    judulTugasController.value.dispose();
    subjudulTugasController.value.dispose();
    deskripsiTugasController.value.dispose();
    endTugasController.value.dispose();
    fileTugasController.value.dispose();
    fileTugasSiswaController.value.dispose();
    fileTugasSiswa.value?.delete();
    super.onClose();
  }

  Future<void> fetchMateriGuru() async {
    try {
      final response = await materiProvider.fetchMateriGuru(id.value);
      namaMatpel.value = response.data['data']['matpel']['nama_matpel'];
      kelas.value =
          '${response.data['data']['kelas']['kls_angka']}${response.data['data']['kelas']['kls_huruf']}';
      idKelas.value = response.data['data']['kelas_id'];

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

  Future<void> fetchMateriSiswa() async {
    try {
      final response = await materiProvider.fetchMateriGuru(id.value);
      namaMatpel.value = response.data['data']['matpel']['nama_matpel'];
      kelas.value =
          '${response.data['data']['kelas']['kls_angka']}${response.data['data']['kelas']['kls_huruf']}';
      namaGuru.value = response.data['data']['guru']['nama'];

      final List<Materi> body = response.data['data']['materi'] == null
          ? []
          : listMateriFromJson(jsonEncode(response.data['data']['materi']));

      materiSiswa.value = body;
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Materi Siswa Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Materi Siswa Failed', e.response?.data.toString() ?? '');
      }
    } finally {
      materiSiswaLoading.value = false;
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
      'kelas_id': idKelas.value,
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

  Future<void> fetchTugasGuru() async {
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

  Future<void> fetchTugasSiswa() async {
    try {
      final response = await materiProvider.fetchTugas(id.value);
      final List<Tugas> body = response.data['data']['tugas'] == null
          ? []
          : listTugasFromJson(jsonEncode(response.data['data']['tugas']));

      tugas.value = body;
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Tugas Siswa Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Tugas Siswa Failed', e.response?.data.toString() ?? '');
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
        failedSnackbar('Fetching Detail Tugas Guru Failed',
            e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Fetching Detail Tugas Guru Failed',
            e.response?.data.toString() ?? '');
      }
    } finally {
      detailTugasLoading.value = false;
      update();
    }
  }

  Future<void> fetchDetailTugasSiswa() async {
    detailTugasLoading.value = true;
    try {
      final response = await materiProvider.fetchDetailTugas(idTugas.value);

      detailTugas.value = tugasFromJson(jsonEncode(response.data['tugas']));
      detailTugasSiswa.value = response.data['tugassiswa'] == null
          ? null
          : tugasSiswaFromJson(jsonEncode(response.data['tugassiswa']));
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Fetching Detail Tugas Siswa Failed',
            e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Fetching Detail Tugas Siswa Failed',
            e.response?.data.toString() ?? '');
      }
    } finally {
      detailTugasLoading.value = false;
      update();
    }
  }

  void storeTugasGuru(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'guru_matpel_id': id.value,
      'kelas_id': idKelas.value,
      'judul': judulTugasController.value.text,
      'subjudul': subjudulTugasController.value.text,
      'deskripsi': deskripsiTugasController.value.text,
      'start_date': DateTime.now(),
      'end_date': endTugasController.value.text,
      'file_tugas': fileTugas.value == null
          ? null
          : await dio.MultipartFile.fromFile(fileTugas.value!.path),
    });

    showLoading(context);

    try {
      final response = await materiProvider.storeTugasGuru(formData);

      successSnackbar('Tambah Tugas Berhasil', response.data['msg']);
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Tambah Tugas Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Tambah Tugas Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  void storeNilai(idTugasSiswa, BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'nilai': nilaiController.value.text,
    });

    showLoading(context);

    try {
      final response = await materiProvider.inputNilai(idTugasSiswa, formData);

      successSnackbar('Input Nilai Berhasil', response.data['msg']);
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Input Nilai Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Input Nilai Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  void storeTugasSiswa(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'file_tugas_siswa': fileTugasSiswa.value == null
          ? null
          : await dio.MultipartFile.fromFile(fileTugasSiswa.value?.path ?? ''),
    });

    showLoading(context);

    try {
      final response =
          await materiProvider.storeTugasSiswa(idTugas.value, formData);

      if (response.statusCode == 200) {
        Get.back();
        successSnackbar('Tugas Berhasil Dikumpulkan', response.data['msg']);
        fileTugasSiswaController.value.clear();
        fileTugasSiswa.value?.delete();
        fetchDetailTugasSiswa();
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Tugas Gagal Dikumpulan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Tugas Gagal Dikumpulan', e.response?.data.toString() ?? '');
      }
    }
  }

  Future<void> fetchOneLicon() async {
    liconLoading.value = true;
    try {
      final response = await materiProvider.fetchOneLicon(id.value);
      licon.value = response.data['data'] == null
          ? null
          : liconFromJson(jsonEncode(response.data['data']));
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Fetching Licon Failed', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Fetching Licon Failed', e.response?.data.toString() ?? '');
      }
    } finally {
      liconLoading.value = false;
      update();
    }
  }

  void storeLicon(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'judul': judulLiconController.value.text,
    });

    showLoading(context);

    try {
      final response = await materiProvider.storelicon(id.value, formData);

      if (response.statusCode == 200) {
        Get.back();
        fetchOneLicon();
        successSnackbar('Buat Room Berhasil', response.data['msg']);
        final meetingController = Get.put(MeetingController());
        final judul = judulLiconController.value.text.replaceAll(' ', '');
        idLicon.value = licon.value?.id.toString() ?? '';
        meetingController.roomName.value = judul;
        meetingController.joinMeeting(context);
        judulLiconController.value.clear();
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Buat Room Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Buat Room Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  Future<void> selesaiLicon() async {
    try {
      final response = await materiProvider.selesaiLicon(idLicon.value);

      if (response.statusCode == 200) {
        Get.back();
        successSnackbar('Live Conference Selesai', response.data['msg']);
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Selesai Licon Gagal', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Selesai Licon Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  Future<void> downloadMateri(file_materi) async {
    final d = dio.Dio(dio.BaseOptions(baseUrl: ApiUrl.storageUrl));
    var progress = 0.0.obs;
    final dir = await getExternalStorageDirectory();
    final saveDir = dir!.path + '/Download/File Materi';
    final file = File('$saveDir/$file_materi');

    try {
      d.download(
        '${StorageEndpoint.file_materi}/$file_materi',
        file.path,
        onReceiveProgress: (count, total) async {
          progress.value = (count / total) * 100;

          if (progress.value == 100.0) {
            infoSnackbar('Download Materi Berhasil', file.path);
            final result = await OpenFilex.open(file.path);
            print(result.message);
          }
        },
      );
    } on dio.DioException catch (e) {
      failedSnackbar('Download Failed', e.response?.data.toString() ?? '');
    }
  }

  Future<void> downloadTugas(file_tugas) async {
    final d = dio.Dio(dio.BaseOptions(baseUrl: ApiUrl.storageUrl));
    var progress = 0.0.obs;
    final dir = await getExternalStorageDirectory();
    final saveDir = dir!.path + '/Download/File Tugas';
    final file = File('$saveDir/$file_tugas');

    try {
      d.download(
        '${StorageEndpoint.file_tugas}/$file_tugas',
        file.path,
        onReceiveProgress: (count, total) async {
          progress.value = (count / total) * 100;

          if (progress.value == 100.0) {
            infoSnackbar('Download Tugas Berhasil', file.path);
            final result = await OpenFilex.open(file.path);
            print(result.message);
          }
        },
      );
    } on dio.DioException catch (e) {
      failedSnackbar('Download Failed', e.response?.data.toString() ?? '');
    }
  }

  Future<void> downloadTugasSiswa(file_tugas_siswa) async {
    final d = dio.Dio(dio.BaseOptions(baseUrl: ApiUrl.storageUrl));
    var progress = 0.0.obs;
    final dir = await getExternalStorageDirectory();
    final saveDir = dir!.path + '/Download/File Tugas Siswa';
    final file = File('$saveDir/$file_tugas_siswa');

    try {
      d.download(
        '${StorageEndpoint.file_tugas_siswa}/$file_tugas_siswa',
        file.path,
        onReceiveProgress: (count, total) async {
          progress.value = (count / total) * 100;

          if (progress.value == 100.0) {
            infoSnackbar('Download Tugas Berhasil', file.path);
            final result = await OpenFilex.open(file.path);
            print(result.message);
          }
        },
      );
    } on dio.DioException catch (e) {
      failedSnackbar('Download Failed', e.response?.data.toString() ?? '');
    }
  }
}
