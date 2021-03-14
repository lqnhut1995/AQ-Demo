import 'package:formz/formz.dart';

enum LastNameValidationError { invalid }

class LastName extends FormzInput<String, LastNameValidationError> {
  const LastName.pure([String value = '']) : super.pure(value);
  const LastName.dirty([String value = '']) : super.dirty(value);

  static final _lastNameRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  LastNameValidationError validator(String value) {
    return _lastNameRegex.hasMatch(value ?? '')
        ? null
        : LastNameValidationError.invalid;
  }
}
