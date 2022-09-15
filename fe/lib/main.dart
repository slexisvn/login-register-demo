import 'package:flutter/material.dart';
import './screens/welcome.dart';
import './screens/login.dart';
import './screens/register/email.dart';
import './screens/register/password.dart';
import './screens/forgot_password.dart';
import './screens/otp_verification.dart';
import './screens/create_new_password.dart';
import './screens/password_changed.dart';
import './constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: MyRoutes.initial,
      routes: {
        MyRoutes.initial: (context) => const WelcomeScreen(),
        MyRoutes.login: (context) => const LoginScreen(),
        MyRoutes.registerEmail: (context) => RegisterEmailScreen(),
        MyRoutes.registerPassword: (context) => RegisterPasswordScreen(),
        MyRoutes.forgotPassword: (context) => ForgotPasswordScreen(),
        MyRoutes.otpVerification: (context) => OTPVerificationScreen(),
        MyRoutes.createNewPassword: (context) => CreateNewPasswordScreen(),
        MyRoutes.passwordChanged: (context) => const PasswordChangedScreen(),
      },
      theme: ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          primary: Colors.black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 19),
          maximumSize: const Size(double.infinity, 56),
          minimumSize: const Size(double.infinity, 56),
          side: const BorderSide(
            color: Colors.black,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 19),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          focusColor: Color(0xffF7F8F9),
          fillColor: Color(0xffF7F8F9),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Color(0xffff4d4f),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Color(0xffff4d4f),
            ),
          ),
          iconColor: Color(0xff6A707C),
          hintStyle: TextStyle(color: Color(0xff8391A1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Color(0xffE8ECF4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Color(0xffE8ECF4),
            ),
          ),
        ),
      ),
    );
  }
}
