import 'package:formz/formz.dart';

import 'password.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError { invalid }

class ConfirmedPassword extends FormzInput<String, PasswordValidationError> {
  const ConfirmedPassword.pure()
      : original = const Password.pure(),
        super.pure('');

  const ConfirmedPassword.dirty({required this.original, String value = ''})
      : super.dirty(value);

  final Password original;

  @override
  PasswordValidationError? validator(String? value) {
    return original.value == value || value == null || value.isEmpty
        ? null
        : PasswordValidationError.invalid;
  }
}
