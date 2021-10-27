import 'package:formz/formz.dart';

/// Validation errors for the [User Name] [FormzInput].
enum UserNameValidationError { invalid }

class UserName extends FormzInput<String, UserNameValidationError> {
  const UserName.pure() : super.pure('');

  const UserName.dirty([String value = '']) : super.dirty(value);

  @override
  UserNameValidationError? validator(String? value) {
    return value != null && value.length >= 4
        ? null
        : UserNameValidationError.invalid;
  }
}
