part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.accessToken = '',
  });

  const AppState.authenticated(String? accessToken)
      : this._(status: AppStatus.authenticated, accessToken: accessToken);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final String? accessToken;

  @override
  List<dynamic> get props => [status, accessToken];
}
