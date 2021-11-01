import 'package:gallery/core/constants/strings.dart';

class ClientApiQuery {
  final String? name;
  final List<String>? allowedGrantTypes;
  ClientApiQuery({
    this.name,
    this.allowedGrantTypes = const [
      Strings.password,
      Strings.refreshToken,
    ],
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'allowedGrantTypes': allowedGrantTypes,
    };
  }
}
