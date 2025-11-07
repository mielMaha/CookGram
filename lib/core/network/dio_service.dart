import 'package:cookgram/core/network/endpoints/api_endpoints.dart';
import 'package:dio/dio.dart';


class DioService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  


  final CancelToken _cancelToken = CancelToken();


  Future<Response> getData({
    required ApiEndpointsEnum endpoint,
    String? param,
    Map<String, dynamic>? queryParams, 
  }) async {
    try {
      
      final path = ApiEndpoints().getpath(endpoint);

      final fullPath = param != null ? '$path$param' : path;

      final response = await _dio.get(
        fullPath,
        queryParameters: queryParams,
        cancelToken: _cancelToken,
      );

      return response;
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      rethrow; 
    } catch (e) {
      print(' Unexpected Error: $e');
      rethrow;
    }
  }

 
}
