import '../models/user.dart';
import '../services/auth.dart';
import 'base.dart';

class AuthRepository extends BaseRepository<AuthService, User> {
  const AuthRepository(AuthService service) : super(service);

  @override
  Future<User> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.auth(apiQuery);
    return User.fromJson(response.data);
  }
}
