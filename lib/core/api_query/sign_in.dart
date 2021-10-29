//Model class to storage auth form data

import 'package:gallery/core/constants/strings.dart';

class SignInApiQuery {
  final String? username;
  final String? password;
  final String? clientId;
  final String? grantType;
  final String? clientSecret;

  const SignInApiQuery({
    this.username,
    this.password,
    this.clientId = Strings.clientId,
    this.grantType = Strings.oAuthGrantType,
    this.clientSecret,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'client_id': clientId,
      'grant_type': grantType,
      'client_secret': clientSecret,
    };
  }
}
