// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class RegisterPageEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class Register extends RegisterPageEvent{
    final String username;
  final String password;
  final String email;
  final String date;
  Register({
    required this.username,
    required this.password,
    required this.email,
    required this.date,
  });
  
  @override
  List<Object?> get props => [username, password, email, date];
}

class ResetRegister extends RegisterPageEvent {
  @override
  List<Object?> get props => [];
}
