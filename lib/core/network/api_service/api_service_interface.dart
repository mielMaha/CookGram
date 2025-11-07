import 'package:cookgram/core/network/endpoints/api_endpoints.dart';

abstract interface class ApiInterface{
  const ApiInterface();

  Future<Map<String, dynamic>> getData({
    required ApiEndpointsEnum endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
  });
  Future<List<Type>> getDataList({
    required ApiEndpointsEnum endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
  });
   
}