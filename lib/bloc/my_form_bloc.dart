import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo/models/email.dart';
import 'package:demo/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'my_form_event.dart';
part 'my_form_state.dart';

class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  MyFormBloc() : super(const MyFormState());

  @override
  void onTransition(Transition<MyFormEvent, MyFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<MyFormState> mapEventToState(MyFormEvent event) async* {
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email,
        status: Formz.validate(
            [email, state.firstName, state.lastName, state.phone]),
      );
    } else if (event is FirstNameChanged) {
      final firstName = FirstName.dirty(event.firstName);
      yield state.copyWith(
        firstName: firstName,
        status: Formz.validate(
            [state.email, firstName, state.lastName, state.phone]),
      );
    } else if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate(
            [email, state.firstName, state.lastName, state.phone]),
      );
    } else if (event is FirstNameUnfocused) {
      final firstName = FirstName.dirty(state.firstName.value);
      yield state.copyWith(
        firstName: firstName,
        status: Formz.validate(
            [state.email, firstName, state.lastName, state.phone]),
      );
    } else if (event is LastNameChanged) {
      final lastName = LastName.dirty(event.lastName);
      yield state.copyWith(
        lastName: lastName,
        status: Formz.validate(
            [state.email, state.firstName, lastName, state.phone]),
      );
    } else if (event is LastNameUnfocused) {
      final lastName = LastName.dirty(state.firstName.value);
      yield state.copyWith(
        lastName: lastName,
        status: Formz.validate(
            [state.email, state.firstName, lastName, state.phone]),
      );
    } else if (event is PhoneChanged) {
      final phone = Phone.dirty(event.phone);
      yield state.copyWith(
        phone: phone,
        status: Formz.validate(
            [state.email, state.firstName, state.lastName, phone]),
      );
    } else if (event is PhoneUnfocused) {
      final phone = Phone.dirty(state.phone.value);
      yield state.copyWith(
        phone: phone,
        status: Formz.validate(
            [state.email, state.firstName, state.lastName, phone]),
      );
    } else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final firstName = FirstName.dirty(state.firstName.value);
      final lastName = LastName.dirty(state.lastName.value);
      final phone = Phone.dirty(state.phone.value);
      yield state.copyWith(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        status: Formz.validate([email, firstName, lastName, phone]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await Future<void>.delayed(const Duration(seconds: 1));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}

class MyFormCubit extends Cubit<MyFormState> {
  MyFormCubit() : super(MyFormState());

  emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate(
        [email, state.firstName, state.lastName, state.phone],
      ),
    ));
  }

  firstNameChanged(String value) {
    final firstName = FirstName.dirty(value);

    emit(state.copyWith(
      firstName: firstName,
      status: Formz.validate(
        [state.email, firstName, state.lastName, state.phone],
      ),
    ));
  }

  lastNameChanged(String value) {
    final lastName = LastName.dirty(value);

    emit(state.copyWith(
      lastName: lastName,
      status: Formz.validate(
        [state.email, state.firstName, lastName, state.phone],
      ),
    ));
  }

  phoneChanged(String value) {
    final phone = Phone.dirty(value);

    emit(state.copyWith(
      phone: phone,
      status: Formz.validate(
        [state.email, state.firstName, state.lastName, phone],
      ),
    ));
  }
}
