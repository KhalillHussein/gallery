//Model class to storage auth form data

import 'package:gallery/core/constants/strings.dart';

class AuthApiQuery {
  final String? username;
  final String? password;
  final String? clientId;
  final String? grantType;
  final String? clientSecret;

  const AuthApiQuery({
    this.username,
    this.password,
    this.clientId = Strings.stringAppId,
    this.grantType = Strings.stringOAuthGrantType,
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

  // final bytes = utf8.encode("foobar");

  // final digest = sha1.convert(utf8.encode(DateTime.now().toString()));
}
