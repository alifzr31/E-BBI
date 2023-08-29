import 'package:dio/dio.dart';
import 'package:elearning/app/core/utils/api_url.dart';
import 'package:elearning/app/core/utils/dio_client.dart';

class ProfileProvider extends DioClient {
  Future<Response> editProfile(FormData formData) async {
    return await post(
      EndPoint.editprofile,
      data: formData,
    );
  }

  Future<Response> changePassword(FormData formData) async {
    return await post(
      EndPoint.changepassword,
      data: formData,
    );
  }
}
