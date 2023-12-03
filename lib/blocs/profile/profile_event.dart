import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileRetrieveEvent extends ProfileEvent {
  final int userId;
  ProfileRetrieveEvent({required this.userId});
}

class ProfileUploadEvent extends ProfileEvent {
  ProfileUploadEvent();
}
