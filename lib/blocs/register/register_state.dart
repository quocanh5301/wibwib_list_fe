import 'package:equatable/equatable.dart';

abstract class RegisterPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitState extends RegisterPageState {
  // final bool reset = true;
  @override
  List<Object?> get props => [];
}

class RegisterProcessingState extends RegisterPageState {
  // final bool reset = true;
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends RegisterPageState {
  final String mess;
  final int code;
  RegisterSuccessState({
    required this.mess,
    required this.code,
  });

  @override
  List<Object?> get props => [mess, code];
}

class RegisterFailState extends RegisterPageState {
  final String error;
  final int code;
  RegisterFailState({
    required this.error,
    required this.code,
  });

  @override
  List<Object?> get props => [error, code];
}
