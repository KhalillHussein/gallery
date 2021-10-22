import 'package:dio/dio.dart';
import '../../core/constants/url.dart';
import 'base.dart';

class AuthService extends BaseService<Dio> {
  AuthService(Dio client) : super(client);

  Future<Response> auth(Map<String, dynamic>? apiQuery) async {
    return client.post(
      Url.auth,
      data: apiQuery,
    );
  }
}
