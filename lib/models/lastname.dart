import 'package:formz/formz.dart';

enum LastNameValidationError { invalid }

class LastName extends FormzInput<String, LastNameValidationError> {
  const LastName.pure([String value = '']) : super.pure(value);
  const LastName.dirty([String value = '']) : super.dirty(value);

  @override
  LastNameValidationError validator(String value) {
    return value.isNotEmpty ? null : LastNameValidationError.invalid;
  }
}
