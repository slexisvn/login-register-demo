// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../../components/layout.dart';
import '../../constants/routes.dart';

class RegisterEmailScreen extends StatelessWidget {
  RegisterEmailScreen({Key? key}) : super(key: key);

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

  Widget renderSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, MyRoutes.registerPassword);
        }
      },
      child: const Text(
        'Next',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Hello! Register to get started',
      showThirdParty: true,
      formElement: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            renderEmailInput(),
            Container(height: 30),
            renderSubmitButton(context)
          ],
        ),
      ),
      footerText1: 'Already have an account?',
      footerText2: 'Login Now',
      onFooterText2Click: () {
        Navigator.pushNamed(context, MyRoutes.login);
      },
    );
  }
}
