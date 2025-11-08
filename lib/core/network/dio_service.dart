import 'package:cookgram/core/network/endpoints/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final CancelToken _cancelToken = CancelToken();

 

  Future<Response> getData({
    required String endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
  }) async {
       final response = await _dio.get(
       endpoint ,
        queryParameters: queryParams,
        cancelToken: _cancelToken,
      );
return response;
  }
}
