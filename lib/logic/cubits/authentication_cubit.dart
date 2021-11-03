import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';
import 'package:gallery/logic/cubits/sign_in_cubit.dart';
import 'package:gallery/logic/cubits/sign_up_cubit.dart';

enum AuthenticationState { authenticated, unauthenticated }

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required SignInCubit signInCubit,
    required SignUpCubit signUpCubit,
  })  : _signInCubit = signInCubit,
        _signUpCubit = signUpCubit,
        super(AuthenticationState.unauthenticated) {
    _signInCubitSubscription = _signInCubit.stream.listen((event) {
      if (event.value != null) emit(AuthenticationState.authenticated);
    });
    _signInCubitSubscription = _signUpCubit.stream.listen((event) {
      if (event.value != null) emit(AuthenticationState.authenticated);
    });
  }

  late StreamSubscription<RequestState> _signInCubitSubscription;
  late StreamSubscription<RequestState> _signUpCubitSubscription;

  final SignInCubit _signInCubit;
  final SignUpCubit _signUpCubit;

  @override
  Future<void> close() {
    _signInCubitSubscription.cancel();
    _signUpCubitSubscription.cancel();
    return super.close();
  }
}
