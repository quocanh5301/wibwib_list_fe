import 'package:equatable/equatable.dart';

abstract class DrawerAppState extends Equatable {
    @override
  List<Object?> get props => [];
}

class DrawerHomeState extends DrawerAppState {}

class DrawerWatchedListState extends DrawerAppState {}

class DrawerFavoriteListState extends DrawerAppState {}
