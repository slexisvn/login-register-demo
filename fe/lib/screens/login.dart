// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../components/layout.dart';
import '../components/password_input.dart';
import '../constants/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Widget renderEmailInput() {
    return FormBuilderTextField(
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

  Widget renderForgotButton() {
    return TextButton(
      style: TextButton.styleFrom(primary: const Color(0xff6A707C)),
      onPressed: () {
        Navigator.pushNamed(context, MyRoutes.forgotPassword);
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

  Widget renderSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Welcome back! Glad to see you, Again!',
      isLogin: true,
      showThirdParty: true,
      formElement: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            renderEmailInput(),
            Container(height: 15),
            PasswordInput(
              name: 'password',
              hintText: 'Password',
              validator: FormBuilderValidators.required(
                errorText: 'Please input your password!',
              ),
            ),
            Container(height: 15),
            renderForgotButton(),
            Container(height: 20),
            renderSubmitButton()
          ],
        ),
      ),
      footerText1: 'Don’t have an account?',
      footerText2: 'Register Now',
      onFooterText2Click: () {
        Navigator.pushNamed(context, MyRoutes.registerEmail);
      },
    );
  }
}
