import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../components/layout.dart';
import '../constants/routes.dart';

class OTPVerificationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  OTPVerificationScreen({Key? key}) : super(key: key);

  Widget renderOTPInput({
    required String name,
    required bool first,
    required bool last,
    required BuildContext context,
  }) {
    return SizedBox(
      height: 60,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: FormBuilderTextField(
          name: name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          autofocus: true,
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          onChanged: (value) {
            if (value!.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }

            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          decoration: InputDecoration(
            counter: const Offstage(),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0xff35C2C1)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, MyRoutes.createNewPassword);
        }
      },
      child: const Text(
        'Verify',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'OTP Verification',
      subTitle:
          'Enter the verification code we just sent on your email address.',
      showThirdParty: false,
      formElement: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                4,
                (index) => renderOTPInput(
                  name: index.toString(),
                  first: index == 0,
                  last: index == 3,
                  context: context,
                ),
              ),
            ),
            Container(height: 20),
            renderSubmitButton(context)
          ],
        ),
      ),
      footerText1: 'Didn’t received code?',
      footerText2: 'Resend',
      onFooterText2Click: () {},
    );
  }
}
