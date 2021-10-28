import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../core/validators/confirm_password.dart';
import '../../../core/validators/date.dart';
import '../../../core/validators/email.dart';
import '../../../core/validators/password.dart';
import '../../../core/validators/user_name.dart';

part 'validate_sign_in_state.dart';

class ValidateSignInCubit extends Cubit<ValidateSignInState> {
  ValidateSignInCubit() : super(ValidateSignInState());

  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    emit(state.copyWith(
      userName: userName,
      status: Formz.validate([
        state.password,
        userName,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        password,
        state.userName,
      ]),
    ));
  }
}
