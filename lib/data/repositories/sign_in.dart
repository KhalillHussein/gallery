import '../models/user.dart';
import '../services/sign_in.dart';
import 'base.dart';

class SignInRepository extends BaseRepository<SignInService, User> {
  const SignInRepository(SignInService service) : super(service);

  @override
  Future<User> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.signIn(apiQuery);
    return User.fromMap(response.data);
  }
}
