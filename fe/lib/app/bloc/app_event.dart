part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppStatusChanged extends AppEvent {
  const AppStatusChanged(this.status);

  final AppStatus status;

  @override
  List<Object> get props => [status];
}

class AppLogoutRequested extends AppEvent {}
