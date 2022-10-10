// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../../components/layout.dart';
import '../../components/password_input.dart';

class RegisterPasswordScreen extends StatelessWidget {
  RegisterPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  Widget renderFullNameInput() {
    return FormBuilderTextField(
      name: 'fullName',
      validator: FormBuilderValidators.required(
        errorText: 'Please input your full name!',
      ),
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        hintText: 'Full name',
      ),
    );
  }

  Widget renderSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
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
      title: 'Enter your full name and password',
      formElement: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            renderFullNameInput(),
            Container(height: 12),
            PasswordInput(
              name: 'password',
              hintText: 'Password',
              validator: FormBuilderValidators.required(
                errorText: 'Please input your password!',
              ),
            ),
            Container(height: 30),
            renderSubmitButton()
          ],
        ),
      ),
    );
  }
}
