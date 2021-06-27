import 'package:doppler/screens/auth/loginScreen/sheet/forget_password.dart';
import 'package:doppler/screens/auth/loginScreen/sheet/goto_signup_screen_line.dart';
import 'package:doppler/screens/auth/loginScreen/sheet/login_button.dart';
import 'package:doppler/screens/auth/loginScreen/sheet/login_with_google.dart';
import 'package:doppler/screens/auth/widgets/valid_email_textformfield.dart';
import 'package:doppler/screens/auth/widgets/valid_password_textformfield.dart';
import 'package:flutter/material.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({Key? key}) : super(key: key);
  @override
  _LoginSheetState createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.5,
      width: size.width - 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ValidEmailTextFormField(email: _email),
                ValidPasswordTextFormField(password: _password),
                const ForgetPassword(),
                const LoginButton(),
              ],
            ),
            Column(
              children: const [
                LoginWithGoogle(),
                GotoSignupScreenLine(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
