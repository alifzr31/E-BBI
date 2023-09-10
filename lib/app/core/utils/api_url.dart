class ApiUrl {
  static const String baseUrl = 'http://192.168.1.11:8000/api';
  static const String storageUrl = 'http://192.168.1.11:8000/storage';
  // static const String baseUrl = 'http://10.1.1.157:8000/api';
  static EndPoint endPoint = EndPoint();
  static StorageEndpoint storageEndpoint = StorageEndpoint();
}

class EndPoint {
  static const String login = '/login';
  static const String profile = '/profile';
  static const String listmatpel = '/listmatpel';
  static const String editprofile = '/editprofile';
  static const String changepassword = '/changepassword';

  static const String homedashboard = '/homedashboard';

  // MATERI GURU
  static const String indexmateriguru = '/indexmateriperpelajaran';
  static const String storemateri = '/storemateri';
  static const String detailmateri = '/detailmateri';
  static const String updatemateri = '/updatemateri';

  static const String indextugasguru = '/indextugasperpelajaran';
  static const String storetugasguru = '/storetugasguru';
  static const String detailtugas = '/detailtugas';
  static const String inputnilai = '/inputnilai';

  static const String storetugassiswa = '/storetugassiswa';

  static const String getOneLicon = '/getonelicon';
  static const String storelicon = '/storelicon';
  static const String selesailicon = '/selesailicon';
}

class StorageEndpoint {
  static const String file_materi = '/file_materi';
  static const String file_tugas = '/file_tugas';
  static const String file_tugas_siswa = '/file_tugas_siswa';
}