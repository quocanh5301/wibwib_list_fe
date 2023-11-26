import 'dart:async';

import 'package:anime_list/blocs/register/register_event.dart';
import 'package:anime_list/blocs/register/register_state.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  final IUserRepository _userRepository;
  RegisterPageBloc({required IUserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterInitState()) {
    on<Register>(_onRegister);
    on<ResetRegister>((event, emit) {
      emit(RegisterInitState());
    });
  }

  FutureOr<void> _onRegister(
      Register event, Emitter<RegisterPageState> emit) async {
    emit(RegisterProcessingState());
    print("_onRegister" + event.password);
    try {
      final result = await _userRepository.register(
        username: event.username,
        password: event.password,
        email: event.email,
        date: event.date,
      );

      if (result != null) {
        emit(RegisterSuccessState(mess: result.mess, code: result.code));
      } else {
        emit(RegisterFailState(error: result!.error!, code: result.code));
      }
    } catch (e) {
      emit(RegisterFailState(error: e.toString(), code: 401));
    }
  }
}
