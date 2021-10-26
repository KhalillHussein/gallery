import 'package:dio/dio.dart';
import '../../core/constants/url.dart';
import 'base.dart';

class TransactionsService extends BaseService<Dio> {
  TransactionsService(Dio client) : super(client);

  Future<Response> getTransactions(Map<String, dynamic>? apiQuery) async {
    return client.get(
      Url.signUp,
      queryParameters: apiQuery,
    );
  }
}
