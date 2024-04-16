import 'package:dio/dio.dart';
import 'dio.dart';

class ApiService {
  Future<Response> get({required String endPoint, dynamic data, dynamic params}) async {
    var response = await dio.get(endPoint, data: data, queryParameters: params);
    return response;
  }

  Future<Response> post({required String endPoint, dynamic data, dynamic params}) async {
    var response = await dio.post(endPoint, data: data, queryParameters: params);
    return response;
  }

  Future<Response> put({required String endPoint}) async {
    var response = await dio.put(endPoint);
    return response;
  }

  Future<Response> delete({required String endPoint}) async {
    var response = await dio.delete(endPoint);
    return response;
  }
}
