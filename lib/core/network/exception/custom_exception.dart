import 'dart:io';
import 'package:dio/dio.dart';

enum ExceptionType {
  tokenExpired,
  cancel,
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  noInternet,
  fetchData,
  format,
  unknown,
  api,
  serialization,
}

class ApiErrorHandler {
  static ExceptionType getExceptionType(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return ExceptionType.cancel;
        case DioExceptionType.connectionTimeout:
          return ExceptionType.connectTimeout;
        case DioExceptionType.sendTimeout:
          return ExceptionType.sendTimeout;
        case DioExceptionType.receiveTimeout:
          return ExceptionType.receiveTimeout;
        case DioExceptionType.badResponse:
         
          return ExceptionType.api;
        default:
          return ExceptionType.unknown;
      }
    } else if (error is SocketException) {
      return ExceptionType.noInternet;
    } else if (error is FormatException) {
      return ExceptionType.format;
    } else {
      return ExceptionType.unknown;
    }
  }

  static String getErrorMessage(ExceptionType type) {
    switch (type) {
      case ExceptionType.tokenExpired:
        return 'Your session has expired. Please log in again.';
      case ExceptionType.cancel:
        return 'Request was cancelled.';
      case ExceptionType.connectTimeout:
        return 'Connection timeout. Please try again.';
      case ExceptionType.sendTimeout:
        return 'Sending data took too long.';
      case ExceptionType.receiveTimeout:
        return 'Receiving data took too long.';
      case ExceptionType.noInternet:
        return 'No internet connection.';
      case ExceptionType.api:
        return 'Server error occurred.';
      case ExceptionType.format:
        return 'Data format error.';
      case ExceptionType.serialization:
        return 'Failed to process data.';
      case ExceptionType.unknown:
      default:
        return 'Unexpected error occurred.';
    }
  }
}
