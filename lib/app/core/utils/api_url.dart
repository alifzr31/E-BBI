class ApiUrl {
  static const String baseUrl = 'http://192.168.1.11:8000/api';
  // static const String baseUrl = 'http://10.1.1.219:8000/api';
  static EndPoint endPoint = EndPoint();
}

class EndPoint {
  static const String login = '/login';
  static const String profile = '/profile';
  static const String listmatpel = '/listmatpel';
  static const String editprofile = '/editprofile';
  static const String changepassword = '/changepassword';

  // MATERI GURU
  static const String indexmateriguru = '/indexmateriperpelajaran';
  static const String storemateri = '/storemateri';
  static const String detailmateri = '/detailmateri';
  static const String updatemateri = '/updatemateri';

  static const String indextugasguru = '/indextugasperpelajaran';
}