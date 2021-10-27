import 'dart:async';

import 'package:dio/dio.dart';

import '../../core/exceptions/api_exceptions.dart';
import '../../data/models/user.dart';
import '../../data/repositories/sign_up.dart';
import 'request_cubit/request_cubit.dart';

class SignUpCubit extends RequestCubit<SignUpRepository, User> {
  SignUpCubit(SignUpRepository repository) : super(repository);

  // late final ValidateCubit validateCubit;
  // StreamSubscription<ValidateState>? validationSubscription;

  @override
  Future<void> loadData([Map<String, dynamic>? apiQuery]) async {
    emit(RequestState.loading(state.value));
    try {
      final data = await repository.fetchData(apiQuery);
      emit(RequestState.loaded(data));
    } on DioError catch (e) {
      emit(RequestState.error(ApiException.fromDioError(e).message));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }

  // Future<void> signUp() async {
  //   await validationSubscription?.cancel();
  //   validationSubscription = validateCubit.stream.listen((state) {
  //     if (state.status.isValid) {
  //       loadData(
  //         SignUpApiQuery(
  //           email: state.email.value,
  //           password: state.password.value,
  //           username: state.userName.value,
  //           birthday: state.birthday.value,
  //         ).toMap(),
  //       );
  //     }
  //   });
  // }

  // @override
  // Future<void> close() {
  //   validationSubscription?.cancel();
  //   return super.close();
  // }
}
