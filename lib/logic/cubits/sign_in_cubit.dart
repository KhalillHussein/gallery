import 'dart:async';

import 'package:dio/dio.dart';
import 'package:gallery/core/api_query/client.dart';
import 'package:gallery/core/api_query/sign_in.dart';
import 'package:gallery/core/constants/strings.dart';
import 'package:gallery/data/repositories/repositories_import.dart';

import '../../core/exceptions/api_exceptions.dart';
import '../../data/models/user.dart';
import 'request_cubit/request_cubit.dart';

class SignInCubit extends RequestCubit<SignInRepository, User> {
  SignInCubit(
    SignInRepository repository,
    this.clientRepository,
    this.currentUserRepository,
  ) : super(repository);

  final ClientRepository clientRepository;
  final CurrentUserRepository currentUserRepository;

  @override
  Future<void> loadData([Map<String, dynamic>? apiQuery]) async {
    emit(RequestState.loading(state.value));
    try {
      final clientData = await clientRepository
          .fetchData(ClientApiQuery(name: apiQuery![Strings.username]).toMap());
      final data = await repository.fetchData(SignInApiQuery(
        clientSecret: clientData.secret,
        password: apiQuery[Strings.password],
        username: apiQuery[Strings.username],
        clientId: '${clientData.id}_${clientData.randomId}',
      ).toMap());
      await repository.saveData(
          accessToken: data[Strings.accessToken],
          refreshToken: data[Strings.refreshToken],
          id: '${clientData.id}_${clientData.randomId}',
          secret: clientData.secret!);
      final userData = await currentUserRepository.fetchData();
      emit(RequestState.loaded(userData));
    } on DioError catch (e) {
      emit(RequestState.error(ApiException.fromDioError(e).message));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
