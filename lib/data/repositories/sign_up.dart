part of repository;

class SignUpRepository extends BaseRepository<SignUpService, User> {
  const SignUpRepository(SignUpService service) : super(service);

  @override
  Future<User> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.signUp(apiQuery);
    return User.fromMap(response.data);
  }
}
