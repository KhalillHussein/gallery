import 'package:dio/dio.dart';
import '../../core/constants/url.dart';
import 'base.dart';

class ClientService extends BaseService<Dio> {
  ClientService(Dio client) : super(client);

  Future<Response> getClient(Map<String, dynamic>? apiQuery) async {
    return client.post(
      Url.clients,
      data: apiQuery,
    );
  }
}
