import 'package:flutter/material.dart';
import 'package:doppler/configs/app_image.dart';
import '../widgets/valide_email_text_form_field.dart';
import '../widgets/valide_password_text_form_field.dart';
import 'forget_password.dart';
import 'goto_signup_screen_line.dart';
import 'login_button.dart';
import 'login_with_google.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: size.width / 3,
                  width: size.width / 4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(iAppLogo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Text(
                'DOPPLER',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              ValideEmailTextFormField(email: _email),
              ValidePasswordTextFormField(password: _password),
              const ForgetPassword(),
              LoginButton(
                email: _email,
                password: _password,
                globalKey: _globalKey,
              ),
              const Spacer(),
              const LoginWithGoogle(),
              const GotoSignupScreenLine(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
