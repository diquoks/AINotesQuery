import 'package:dio/dio.dart';

class QueryHelper {
  Future<void> request<T>({
    required Future<T> Function() request,
    required void Function(T) onResponse,
    required void Function(String) onError,
    bool useShortError = true,
  }) async {
    try {
      T response = await request();
      onResponse(response);
    } on Exception catch (e) {
      onError(castError(e, useShortError));
    }
  }

  String castError(Exception e, bool useShortError) {
    if (e is DioException) {
      if (useShortError) {
        return "HTTP ${e.response!.statusCode}";
      }

      if (e.response != null) {
        try {
          return "${e.response!.data["error"]["message"]} (${e.response!.data["error"]["code"]})";
        } on Exception {
          return e.toString();
        }
      }
    }
    return e.toString();
  }
}
