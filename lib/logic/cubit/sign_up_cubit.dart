import 'package:dio/dio.dart';
import '../../core/exceptions/api_exceptions.dart';
import '../../data/models/user.dart';

import '../../data/repositories/sign_up.dart';
import 'request_cubit.dart';

class SignUpCubit extends RequestCubit<SignUpRepository, User> {
  SignUpCubit(SignUpRepository repository) : super(repository);

  @override
  Future<void> loadData([Map<String, dynamic>? apiQuery]) async {
    emit(RequestState.loading(state.value));
    try {
      final data = await repository.fetchData(apiQuery);
      emit(RequestState.loaded(data));
    } on DioError catch (e) {
      if (e.response?.data['detail'] != null) {
        emit(RequestState.error(e.response?.data['detail']));
      } else {
        emit(RequestState.error(ApiException.fromDioError(e).message));
      }
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}