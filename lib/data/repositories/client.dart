import 'package:gallery/data/models/client.dart';
import 'package:gallery/data/services/client.dart';

import 'base.dart';

class ClientRepository extends BaseRepository<ClientService, Client> {
  const ClientRepository(ClientService service) : super(service);

  @override
  Future<Client> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.getClient(apiQuery);
    return Client.fromMap(response.data);
  }
}
