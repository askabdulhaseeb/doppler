import 'package:doppler/database/app_user_methods.dart';
import 'package:doppler/database/auth_mathods.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final String designation;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final GlobalKey<FormState> globalKey;
  const SignupButton({
    Key? key,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.designation,
    required this.globalKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      // radius: 30,
      onTap: () {
        if (globalKey.currentState!.validate()) {
          if (password.text.trim() == confirmPassword.text.trim()) {
            AuthMethods().signupWithEmailAndPassword(
              name: name.text.trim(),
              email: email.text.trim(),
              password: password.text.trim(),
              designation: designation,
            );
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text(
          'Sign up',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
