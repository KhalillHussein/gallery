import 'package:dio/dio.dart';
import '../../core/constants/url.dart';
import 'base.dart';

class SignUpService extends BaseService<Dio> {
  SignUpService(Dio client) : super(client);

  Future<Response> signUp(Map<String, dynamic>? apiQuery) async {
    return client.post(
      Url.signIn,
      data: apiQuery,
    );
  }
}
