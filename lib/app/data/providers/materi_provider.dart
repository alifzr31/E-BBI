import 'package:elearning/app/core/utils/api_url.dart';
import 'package:elearning/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class MateriProvider extends DioClient {
  Future<Response> fetchMateriGuru(id) async {
    return await get('${EndPoint.indexmateriguru}/$id');
  }

  Future<Response> fetchDetailMateri(id) async {
    return await get('${EndPoint.detailmateri}/$id');
  }

  Future<Response> storeMateriGuru(FormData formData) async {
    return await post(
      EndPoint.storemateri,
      data: formData,
    );
  }

  Future<Response> editMateriGuru(id, FormData formData) async {
    return await post(
      '${EndPoint.updatemateri}/$id',
      data: formData,
    );
  }

  Future<Response> fetchTugas(id) async {
    return await get('${EndPoint.indextugasguru}/$id');
  }

  Future<Response> fetchDetailTugas(idTugas) async {
    return await get('${EndPoint.detailtugas}/$idTugas');
  }
}
