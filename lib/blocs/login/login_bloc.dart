import 'dart:async';

import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:anime_list/utils/helper/share_preferences.dart'
    as sharePreferences;

part 'login_state.dart';
part 'login_event.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final IUserRepository _userRepository;

  LoginPageBloc({required IUserRepository userRepository})
      : _userRepository = userRepository,
        super(LoginInitState()) {
    on<Login>(_onLogin);
    on<ResetLogin>((event, emit) {
      emit(LoginInitState());
    });
  }

  FutureOr<void> _onLogin(Login event, Emitter<LoginPageState> emit) async {
    emit(LoginProcessingState());
    try {
      final result = await _userRepository.login(
        username: event.username,
        password: event.password,
      );

      if (result != null) {
        final UserDataModel userDataModel =
            UserDataModel.fromMap(JWT.decode(result.accessToken).payload);

        sharePreferences.saveUserToSharedPreferences(userDataModel);
        emit(LoginSuccessState(model: userDataModel, code: result.code));
      } else {
        emit(LoginFailState(error: result!.mess!, code: result.code));
      }
    } catch (e) {
      emit(LoginFailState(error: e.toString(), code: 401));
    }
  }
}
