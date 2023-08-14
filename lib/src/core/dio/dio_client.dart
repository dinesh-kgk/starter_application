import 'package:dio/dio.dart';

const baseUrl = "https://dummyjson.com/";

Dio buildDio() {
  final dio = Dio();
  dio.options = BaseOptions(
    baseUrl: baseUrl,
  );
  dio.interceptors.add(LogInterceptor());
  return dio;
}
