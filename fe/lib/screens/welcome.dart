import 'package:flutter/material.dart';
import '../constants/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  Widget renderCompanyName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Fruzz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        Text(
          'digital',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ],
    );
  }

  Widget renderButtonGroup(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.login);
          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Container(height: 15),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.registerEmail);
          },
          child: const Text('Register'),
        ),
      ],
    );
  }

  Widget guestButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: const Color(0xff35C2C1),
      ),
      onPressed: () {},
      child: const Text(
        'Continue as a guest',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/welcome_bg.png'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                'assets/logo_icon.png',
                width: 58,
                height: 58,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 44),
                child: renderCompanyName(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: renderButtonGroup(context),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 46,
                  bottom: 30,
                ),
                child: guestButton(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
