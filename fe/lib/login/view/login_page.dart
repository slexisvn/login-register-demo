// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../repos/repos.dart';
import '../../widgets/widgets.dart';
import '../cubit/login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route<LoginPage> route() {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Welcome back! Glad to see you, Again!',
      isLogin: true,
      showThirdParty: true,
      formElement: BlocProvider(
        create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
        child: const LoginForm(),
      ),
      footerText1: 'Don’t have an account?',
      footerText2: 'Register Now',
      onFooterText2Click: () {
        // Navigator.pushNamed(context, MyRoutes.registerEmail);
      },
    );
  }
}
