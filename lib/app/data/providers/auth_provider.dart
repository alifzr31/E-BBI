import 'package:elearning/app/core/utils/api_url.dart';
import 'package:elearning/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class AuthProvider extends DioClient {
  Future<Response> login(FormData formData) async {
    return await post(
      EndPoint.login,
      data: formData,
    );
  }
}
