// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Project imports:
import 'app/app.dart';
import 'helper/helper.dart';
import 'repos/repos.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  DioHelper.init();
  await PrefsHelper.init();

  runApp(
    App(
      authenticationRepository: AuthenticationRepository(),
    ),
  );
}
