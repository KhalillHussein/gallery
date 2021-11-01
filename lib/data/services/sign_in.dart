import 'package:dio/dio.dart';
import '../../core/constants/url.dart';
import 'base.dart';

class SignInService extends BaseService<Dio> {
  SignInService(Dio client) : super(client);

  Future<Response> signIn(Map<String, dynamic>? apiQuery) async {
    // return oauth2.resourceOwnerPasswordGrant(
    //     Uri.parse(Url.signIn), apiQuery?['username'], apiQuery?['password'],
    //     identifier: Strings.clientId, secret: Strings.clientSecret);

    return client.get(
      Url.signIn,
      queryParameters: apiQuery,
    );
  }
}