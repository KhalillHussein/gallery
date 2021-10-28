import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../core/validators/confirm_password.dart';
import '../../../core/validators/date.dart';
import '../../../core/validators/email.dart';
import '../../../core/validators/password.dart';
import '../../../core/validators/user_name.dart';

part 'validate_sign_up_state.dart';

class ValidateSignUpCubit extends Cubit<ValidateSignUpState> {
  ValidateSignUpCubit() : super(ValidateSignUpState());

  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    emit(state.copyWith(
      userName: userName,
      status: Formz.validate([
        state.email,
        userName,
        state.password,
        state.confirmPassword,
        state.birthday,
      ]),
    ));
  }

  void birthdayChanged(String value) {
    final birthday = Date.dirty(value);
    emit(state.copyWith(
      birthday: birthday,
      status: Formz.validate([
        state.email,
        birthday,
        state.password,
        state.userName,
        state.confirmPassword,
      ]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password,
        state.userName,
        state.confirmPassword,
        state.birthday,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmPassword = ConfirmedPassword.dirty(
      original: password,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmPassword: confirmPassword,
      status: Formz.validate([
        state.email,
        password,
        state.userName,
        state.confirmPassword,
        state.birthday,
      ]),
    ));
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmedPassword.dirty(
      original: state.password,
      value: value,
    );
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([
        state.email,
        confirmPassword,
        state.userName,
        state.password,
        state.birthday,
      ]),
    ));
  }
}
