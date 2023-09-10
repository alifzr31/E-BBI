import 'package:elearning/app/core/utils/api_url.dart';
import 'package:elearning/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class DashboardProvider extends DioClient {
  Future<Response> fetchHomeDashboard() async {
    return await get(EndPoint.homedashboard);
  }
  
  Future<Response> fetchProfile() async {
    return await get(EndPoint.profile);
  }

  Future<Response> fetchListMatpel() async {
    return await get(EndPoint.listmatpel);
  }
}
