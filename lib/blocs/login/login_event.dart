part of 'login_bloc.dart';

abstract class LoginPageEvent extends Equatable {}

class Login extends LoginPageEvent {
  final String username;
  final String password;

  Login({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class ResetLogin extends LoginPageEvent {
  @override
  List<Object?> get props => [];
}
