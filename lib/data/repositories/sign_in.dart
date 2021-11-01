import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gallery/core/constants/strings.dart';

import '../services/sign_in.dart';
import 'base.dart';

class SignInRepository
    extends BaseRepository<SignInService, Map<String, dynamic>> {
  const SignInRepository(SignInService service, this.storage) : super(service);
  final FlutterSecureStorage storage;

  @override
  Future<Map<String, dynamic>> fetchData(
      [Map<String, dynamic>? apiQuery]) async {
    final response = await service.signIn(apiQuery);
    return response.data;
  }

  Future<void> saveData(
      {required String accessToken,
      required String refreshToken,
      required String id,
      required String secret}) async {
    await storage.write(key: Strings.userAccessToken, value: accessToken);
    await storage.write(key: Strings.userRefreshToken, value: refreshToken);
    await storage.write(key: Strings.userId, value: id);
    await storage.write(key: Strings.userSecret, value: secret);
  }
}
