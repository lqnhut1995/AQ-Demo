part of 'my_form_bloc.dart';

abstract class MyFormEvent extends Equatable {
  const MyFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends MyFormEvent {
  const EmailChanged({this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends MyFormEvent {}

class FirstNameChanged extends MyFormEvent {
  const FirstNameChanged({this.firstName});

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class FirstNameUnfocused extends MyFormEvent {}

class LastNameChanged extends MyFormEvent {
  const LastNameChanged({this.lastName});

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class LastNameUnfocused extends MyFormEvent {}

class PhoneChanged extends MyFormEvent {
  const PhoneChanged({this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PhoneUnfocused extends MyFormEvent {}

class FormSubmitted extends MyFormEvent {}
