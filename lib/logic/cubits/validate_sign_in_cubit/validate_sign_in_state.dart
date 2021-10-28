part of 'validate_sign_in_cubit.dart';

class ValidateSignInState extends Equatable {
  const ValidateSignInState({
    this.password = const Password.pure(),
    this.userName = const UserName.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Password password;
  final UserName userName;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [
        password,
        userName,
        status,
      ];

  ValidateSignInState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmPassword,
    UserName? userName,
    Date? birthday,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return ValidateSignInState(
      password: password ?? this.password,
      userName: userName ?? this.userName,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
