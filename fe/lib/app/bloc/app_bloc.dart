// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../enums/enums.dart';
import '../../repos/repos.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.token.isNotEmpty
              ? AppState.authenticated(authenticationRepository.token)
              : const AppState.unauthenticated(),
        ) {
    on<AppStatusChanged>(_onAppStatusChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _appStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AppStatusChanged(status)),
    );
  }

  late StreamSubscription<AppStatus> _appStatusSubscription;

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onAppStatusChanged(
    AppStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    switch (event.status) {
      case AppStatus.unauthenticated:
        return emit(const AppState.unauthenticated());
      case AppStatus.authenticated:
        return emit(AppState.authenticated(_authenticationRepository.token));
    }
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    _authenticationRepository.logOut();
  }

  @override
  Future<void> close() {
    _appStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
}
