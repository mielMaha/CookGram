import 'package:cookgram/core/network/api_service/api_service_interface.dart';
import 'package:cookgram/core/network/dio_service.dart';

import 'package:cookgram/core/network/exception/custom_exception.dart';

class ApiService implements ApiInterface {
  final DioService _dioService;

  ApiService(this._dioService);

  @override
  Future<T> getData<T>({
    required String endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic> json) converter,
  }) async {
    try {
      final response = await _dioService.getData(
        endpoint: endpoint,
        param: param,
        queryParams: queryParams,
      );

      if (response.data == null) {
        throw Exception('Response data is null.');
      }

      return converter(response.data);
    } catch (error) {
      final exceptionType = ApiErrorHandler.getExceptionType(error);
      final message = ApiErrorHandler.getErrorMessage(exceptionType);
      throw Exception(message);
    }
  }

  @override
  Future<List<T>> getDataList<T>({
    required String endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic> json) converter,
    String? key='meals',
  }) async {
    try {
      final response = await _dioService.getData(
        endpoint: endpoint,
        param: param,
        queryParams: queryParams,
      );

      final List<dynamic> dataList = response.data[key] ?? [];
      return dataList.map((item) => converter(item as Map<String, dynamic>)).toList();
    } catch (error) {
      final exceptionType = ApiErrorHandler.getExceptionType(error);
      final message = ApiErrorHandler.getErrorMessage(exceptionType);
      throw Exception(message);
    }
  }
}
