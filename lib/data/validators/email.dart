import 'package:formz/formz.dart';
import 'package:gallery/core/constants/formatters.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return AppFormatters.emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}
