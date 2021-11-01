import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gallery/core/constants/strings.dart';

class AuthInterceptor extends Interceptor {
  final Dio httpClient;
  final _storage = FlutterSecureStorage();
  // final HttpOauthGateway _httpOauthGateway;

  // AuthInterceptor(this._dio, this._httpOauthGateway);

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

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // final String? accessToken =
      //     await _httpOauthGateway.refreshToken().catchError((onError) {
      //   handler.reject(err);
      // });
      // if (accessToken != null) {
      //   print(accessToken);
      //   err.requestOptions.headers = {
      //     Strings.authorization: '${Strings.tokenType} $accessToken'
      //   };
      //   httpClient.fetch(err.requestOptions).then(
      //         (r) => handler.resolve(r),
      //         onError: (e) => handler.reject(e),
      //       );
      //   return;
      // }
    } else {
      return handler.next(err);
    }
  }
}
