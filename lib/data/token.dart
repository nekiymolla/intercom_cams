import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SessionManager {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  SessionManager._();

  static Dio api = Dio();
  String? accessToken;
  final _storage = const FlutterSecureStorage();

  SessionManager() {
    api.interceptors.add(PrettyDioLogger(requestHeader: true));
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  void updatetoken(String update) {
    api.options.headers["Authorization"] = 'Bearer $update';
    _storage.write(key: "authkey", value: update);
  }

  void refreshtoken(String token) {
    api.options.headers["refresh"] = '<refresh $token>';
    _storage.write(key: "refreshkey", value: token);
  }
}
