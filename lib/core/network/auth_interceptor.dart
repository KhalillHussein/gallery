import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gallery/core/constants/strings.dart';

class AuthInterceptor extends Interceptor {
  final Dio httpClient;
  final _storage = FlutterSecureStorage();

  AuthInterceptor(this.httpClient);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? accessToken =
        await _storage.read(key: Strings.userAccessToken);
    if (accessToken != null) {
      options.headers = {
        Strings.authorization: '${Strings.tokenType} $accessToken'
      };
    }
    return handler.next(options);
  }
}
