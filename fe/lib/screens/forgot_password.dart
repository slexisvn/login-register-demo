// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../components/layout.dart';
import '../constants/routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  ForgotPasswordScreen({Key? key}) : super(key: key);

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

  Widget renderSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, MyRoutes.otpVerification);
        }
      },
      child: const Text(
        'Send Code',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Forgot Password?',
      subTitle:
          'Don\'t worry! It occurs. Please enter the email address linked with your account.',
      formElement: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            renderEmailInput(),
            Container(height: 20),
            renderSubmitButton(context)
          ],
        ),
      ),
      footerText1: 'Remember Password?',
      footerText2: 'Login',
      onFooterText2Click: () {
        Navigator.pushNamed(context, MyRoutes.login);
      },
    );
  }
}
