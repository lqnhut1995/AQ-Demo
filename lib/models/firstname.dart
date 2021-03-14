import 'package:formz/formz.dart';

enum FirstNameValidationError { invalid }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure([String value = '']) : super.pure(value);
  const FirstName.dirty([String value = '']) : super.dirty(value);

  static final _firstNameRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  FirstNameValidationError validator(String value) {
    return _firstNameRegex.hasMatch(value ?? '')
        ? null
        : FirstNameValidationError.invalid;
  }
}
