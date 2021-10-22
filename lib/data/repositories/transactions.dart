import '../models/transaction.dart';
import '../services/transactions.dart';
import 'base.dart';

class TransactionsRepository
    extends BaseRepository<TransactionsService, List<Transaction>> {
  const TransactionsRepository(TransactionsService service) : super(service);

  @override
  Future<List<Transaction>> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.getTransactions(apiQuery);
    return [for (final item in response.data) Transaction.fromJson(item)];
  }
}
