part of repository;

class CurrentUserRepository extends BaseRepository<CurrentUserService, User> {
  const CurrentUserRepository(CurrentUserService service) : super(service);

  @override
  Future<User> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.getUser(apiQuery);
    return User.fromMap(response.data);
  }
}
