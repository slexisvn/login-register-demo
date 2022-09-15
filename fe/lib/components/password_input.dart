import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordInput extends StatefulWidget {
  final String hintText;
  final String name;
  final String? Function(String?)? validator;

  const PasswordInput({
    Key? key,
    this.hintText = '',
    this.name = '',
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      validator: widget.validator,
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggle,
        ),
      ),
    );
  }
}
