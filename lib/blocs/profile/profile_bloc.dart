import 'dart:async';

import 'package:anime_list/blocs/profile/profile_event.dart';
import 'package:anime_list/blocs/profile/profile_state.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_list/utils/helper/share_preferences.dart' as sharePref;

class ProfilePageBloc extends Bloc<ProfileEvent, ProfilePageState> {
  final IUserRepository _userRepository;
  ProfilePageBloc({required IUserRepository userRepository})
      : _userRepository = userRepository,
        super(ProfileInitState()) {
    on<ProfileRetrieveEvent>(_onProfileRetrieve);
    // on<ProfileUploadEvent>();
  }

  FutureOr<void> _onProfileRetrieve(
      ProfileRetrieveEvent event, Emitter<ProfilePageState> emit) async {
    emit(ProfileLoadingState());
    final result = await _userRepository.retrieveUserData(userId: event.userId);
    if (result != null) {
      sharePref.saveUserToSharedPreferences(result);
      emit(ProfileRetrieveSuccessState(userDataModel: result));
    } else {
      emit(ProfileRetrieveFailState());
    }
  }
}
