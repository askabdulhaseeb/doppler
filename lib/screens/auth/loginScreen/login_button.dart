import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../database/app_user_methods.dart';
import '../../../database/auth_mathods.dart';
import '../../../screens/widgets/show_loading.dart';
import '../../admin/homeScreen/home_screen.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> globalKey;
  const LoginButton({
    Key? key,
    required this.email,
    required this.password,
    required this.globalKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () async {
        if (globalKey.currentState!.validate()) {
          showLoadingDislog(context);
          final User? _user = await AuthMethods().loginWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
          Navigator.of(context).pop();
          if (_user != null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AdminHomeScreen.routeName,
              (route) => false,
            );
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
