part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterRequestEvent extends RegisterEvent {
  final String email;
  final String password;
  final String name;

  const RegisterRequestEvent(
      {required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [email, password];
}
