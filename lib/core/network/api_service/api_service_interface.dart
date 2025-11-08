
abstract interface class ApiInterface {
  const ApiInterface();

  Future<T> getData<T>({
    required String endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic> responseBody) converter
  });


  Future<List<T>> getDataList<T>({
    required String endpoint,
    String? param,
    Map<String, dynamic>? queryParams,
        required T Function(Map<String, dynamic> responseBody) converter

  });
}
