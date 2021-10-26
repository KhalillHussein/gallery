// import 'package:dio/dio.dart';
// import '../../core/exceptions/api_exceptions.dart';
// import '../../data/models/transaction.dart';

// import '../../data/repositories/transactions.dart';
// import 'request_cubit.dart';

// class TransactionsCubit
//     extends RequestCubit<TransactionsRepository, List<Transaction>> {
//   TransactionsCubit(TransactionsRepository repository) : super(repository);

//   @override
//   Future<void> loadData([Map<String, dynamic>? apiQuery]) async {
//     emit(RequestState.loading(state.value));
//     try {
//       final data = await repository.fetchData(apiQuery);
//       emit(RequestState.loaded(data));
//     } on DioError catch (e) {
//       emit(RequestState.error(ApiException.fromDioError(e).message));
//     } catch (e) {
//       emit(RequestState.error(e.toString()));
//     }
//   }
// }
