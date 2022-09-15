import 'package:flutter/material.dart';
import '../constants/routes.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/successmark.png',
              width: 100,
              height: 100,
            ),
            Container(height: 35),
            const Text(
              'Password Changed!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(height: 8),
            const Text(
              'Your password has been changed successfully.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff8391A1),
              ),
            ),
            Container(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.login);
              },
              child: const Text('Back to Login'),
            )
          ],
        ),
      ),
    );
  }
}
