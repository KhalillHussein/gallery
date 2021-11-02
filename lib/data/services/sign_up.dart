part of service;

class SignUpService extends BaseService<Dio> {
  SignUpService(Dio client) : super(client);

  Future<Response> signUp(Map<String, dynamic>? apiQuery) async {
    return client.post(
      Url.signUp,
      data: apiQuery,
    );
  }
}
