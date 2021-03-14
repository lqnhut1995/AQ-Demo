part of 'my_form_bloc.dart';

class MyFormState extends Equatable {
  const MyFormState({
    this.email = const Email.pure(),
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.phone = const Phone.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final FirstName firstName;
  final LastName lastName;
  final Phone phone;
  final FormzStatus status;

  MyFormState copyWith({
    Email email,
    FirstName firstName,
    LastName lastName,
    Phone phone,
    FormzStatus status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, firstName, lastName, phone, status];
}
