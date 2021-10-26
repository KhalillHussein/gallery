import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:gallery/data/validators/confirm_password.dart';
import 'package:gallery/data/validators/email.dart';
import 'package:gallery/data/validators/password.dart';
import 'package:gallery/data/validators/user_name.dart';

part 'validate_state.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(ValidateState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password,
        state.userName,
        state.confirmPassword,
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
      ]),
    ));
  }

  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    emit(state.copyWith(
      userName: userName,
      status: Formz.validate([
        state.email,
        userName,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }
}
