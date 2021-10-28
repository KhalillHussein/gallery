part of 'validate_sign_up_cubit.dart';

class ValidateSignUpState extends Equatable {
  const ValidateSignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmedPassword.pure(),
    this.userName = const UserName.pure(),
    this.birthday = const Date.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmPassword;
  final UserName userName;
  final Date birthday;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [
        email,
        password,
        userName,
        birthday,
        status,
        confirmPassword,
      ];

  ValidateSignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmPassword,
    UserName? userName,
    Date? birthday,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return ValidateSignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      birthday: birthday ?? this.birthday,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      userName: userName ?? this.userName,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
