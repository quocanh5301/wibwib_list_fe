import 'package:equatable/equatable.dart';

abstract class DrawerAppEvent extends Equatable {
    @override
  List<Object?> get props => [];
}

class DrawerHomeEvent extends DrawerAppEvent {}

class DrawerWatchedListEvent extends DrawerAppEvent {}

class DrawerFavoriteListEvent  extends DrawerAppEvent {}