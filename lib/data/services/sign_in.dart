part of service;

class SignInService extends BaseService<Dio> {
  SignInService(Dio client) : super(client);

  Future<Response> signIn(Map<String, dynamic>? apiQuery) async {
    client
      ..interceptors.clear()
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    return client.get(
      Url.token,
      queryParameters: apiQuery,
    );
  }
}
