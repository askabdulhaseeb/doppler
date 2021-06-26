import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/SignupScreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Signup Screen'),
      ),
    );
  }
}
