import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

/// Validation errors for the [Date] [FormzInput].
enum DateValidationError { invalid }

class Date extends FormzInput<String, DateValidationError> {
  const Date.pure() : super.pure('');

  const Date.dirty([String value = '']) : super.dirty(value);

  @override
  DateValidationError? validator(String? value) {
    return value != null && isDate ? null : DateValidationError.invalid;
  }

  bool get isDate {
    try {
      DateFormat.yMd().parseStrict(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
