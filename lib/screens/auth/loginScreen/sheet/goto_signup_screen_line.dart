import 'package:doppler/screens/auth/signupScreen/signup_screen.dart';
import 'package:flutter/material.dart';

class GotoSignupScreenLine extends StatelessWidget {
  const GotoSignupScreenLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '''Don't have account? ''',
          style: TextStyle(color: Colors.black),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SignupScreen.routeName);
          },
          child: const Text(
            ''' SignUp''',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
