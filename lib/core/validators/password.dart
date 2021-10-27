import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return value != null && value.length >= 5
        ? null
        : PasswordValidationError.invalid;
  }
}
