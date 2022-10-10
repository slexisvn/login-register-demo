// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../components/layout.dart';
import '../components/password_input.dart';
import '../constants/routes.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  CreateNewPasswordScreen({Key? key}) : super(key: key);

  Widget renderSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, MyRoutes.passwordChanged);
        }
      },
      child: const Text(
        'Reset Password',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Create new password',
      subTitle: 'Your new password must be unique from those previously used.',
      formElement: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            PasswordInput(
              name: 'password',
              hintText: 'Password',
              validator: FormBuilderValidators.required(
                errorText: 'Please input your password!',
              ),
            ),
            Container(height: 12),
            PasswordInput(
              name: 'confirmPassword',
              hintText: 'Confirm password',
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Password must be confirmed!';
                }

                if (_formKey.currentState!.fields['password']?.value != val) {
                  return 'Your password and confirmation password do not match!';
                }

                return null;
              },
            ),
            Container(height: 30),
            renderSubmitButton(context),
          ],
        ),
      ),
    );
  }
}
