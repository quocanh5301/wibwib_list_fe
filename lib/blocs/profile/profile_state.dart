// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:anime_list/data/models/user_account_model.dart';

abstract class ProfilePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitState extends ProfilePageState {
  ProfileInitState();
}

class ProfileRetrieveSuccessState extends ProfilePageState {
  UserDataModel userDataModel;
  ProfileRetrieveSuccessState({
    required this.userDataModel,
  });
}

class ProfileRetrieveFailState extends ProfilePageState {
  ProfileRetrieveFailState();
}

class ProfileUploadSuccessState extends ProfilePageState {
  ProfileUploadSuccessState();
}

class ProfileUploadFailState extends ProfilePageState {
  ProfileUploadFailState();
}

class ProfileLoadingState extends ProfilePageState {
  ProfileLoadingState();
}

class ProfileLoadedState extends ProfilePageState {
  ProfileLoadedState();
}
