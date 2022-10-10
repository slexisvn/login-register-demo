// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../../enums/enums.dart';
import '../../widgets/widgets.dart';
import '../cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  static Route<LoginForm> route() {
    return MaterialPageRoute(builder: (_) => const LoginForm());
  }

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _EmailInput(),
            Container(height: 15),
            _PasswordInput(),
            Container(height: 15),
            _ForgotButton(),
            Container(height: 20),
            _LoginButton(
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      keyboardType: TextInputType.emailAddress,
      name: 'email',
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: 'Please input your email!',
          ),
          FormBuilderValidators.email(errorText: 'Email is not valid!'),
        ],
      ),
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PasswordInput(
      name: 'password',
      hintText: 'Password',
      validator: FormBuilderValidators.required(
        errorText: 'Please input your password!',
      ),
    );
  }
}

class _ForgotButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: const Color(0xff6A707C)),
      onPressed: () {
        // Navigator.pushNamed(context, MyRoutes.forgotPassword);
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.formKey});

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.saveAndValidate()) {
          context
              .read<LoginCubit>()
              .logInWithCredentials(formValue: formKey.currentState!.value);
        }
      },
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
