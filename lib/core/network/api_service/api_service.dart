import 'package:cookgram/core/network/api_service/api_service_interface.dart';
import 'package:cookgram/core/network/dio_service.dart';
import 'package:cookgram/core/network/endpoints/api_endpoints.dart';
import 'package:dio/dio.dart';

class ApiService implements ApiInterface {
  DioService _dioService;

  ApiService(DioService dioService) : _dioService = dioService;
  @override
  Future<Map<String, dynamic>> getData({
    required ApiEndpointsEnum endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
  }) async {
    Map<String, dynamic> json;
    try {
      final response = await _dioService.getData(
        endpoint: endpoint,
        param: param,
        queryParams: queryParams,
      );

      json = response.data;

      return json;
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      rethrow;
    }
  }

  @override
  Future<List<Type>> getDataList({
    required ApiEndpointsEnum endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
  }) {
    // TODO: implement getDataList
    throw UnimplementedError();
  }
}
