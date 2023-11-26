part of 'login_bloc.dart';

abstract class LoginPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitState extends LoginPageState {}

class LoginProcessingState extends LoginPageState {
  // final bool reset = true;
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginPageState {
  final UserDataModel model;
  final int code;
  LoginSuccessState({
    required this.model,
    required this.code,
  });

  @override
  List<Object?> get props => [model, code];
}

class LoginFailState extends LoginPageState {
  final String error;
  final int code;
  LoginFailState({
    required this.error,
    required this.code,
  });

  @override
  List<Object?> get props => [error, code];
}
