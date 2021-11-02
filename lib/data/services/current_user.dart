part of service;

class CurrentUserService extends BaseService<Dio> {
  CurrentUserService(Dio client) : super(client);

  Future<Response> getUser(Map<String, dynamic>? apiQuery) async {
    client.interceptors.clear();
    client.interceptors.add(AuthInterceptor(client));
    return client.get(Url.currentUser);
  }
}
