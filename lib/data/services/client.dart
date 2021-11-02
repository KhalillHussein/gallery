part of service;

class ClientService extends BaseService<Dio> {
  ClientService(Dio client) : super(client);

  Future<Response> getClient(Map<String, dynamic>? apiQuery) async {
    return client.post(
      Url.clients,
      data: apiQuery,
    );
  }
}
