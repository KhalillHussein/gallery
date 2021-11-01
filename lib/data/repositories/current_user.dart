import 'package:gallery/data/services/current_user.dart';

import '../models/user.dart';
import 'base.dart';

class CurrentUserRepository extends BaseRepository<CurrentUserService, User> {
  const CurrentUserRepository(CurrentUserService service) : super(service);

  @override
  Future<User> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.getUser(apiQuery);
    return User.fromMap(response.data);
  }
}
