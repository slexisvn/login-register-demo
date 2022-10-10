// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../enums/app_status.dart';
import '../../home/home.dart';
import '../../repos/auth/auth.dart';
import '../../theme.dart';
import '../../welcome/welcome.dart';
import '../app.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      home: BlocConsumer<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          switch (state.status) {
            case AppStatus.authenticated:
              _navigator.pushAndRemoveUntil<void>(
                HomePage.route(),
                (route) => false,
              );
              break;
            case AppStatus.unauthenticated:
              _navigator.pushAndRemoveUntil<void>(
                WelcomePage.route(),
                (route) => false,
              );
              break;
          }
        },
        builder: (context, state) {
          return state.status == AppStatus.authenticated
              ? const HomePage()
              : const WelcomePage();
        },
      ),
    );
  }
}
