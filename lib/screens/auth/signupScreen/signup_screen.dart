import 'package:doppler/configs/app_image.dart';
import 'package:doppler/screens/auth/signupScreen/signup_button.dart';
import 'package:doppler/screens/auth/widgets/valide_name_text_form_field.dart';
import 'package:doppler/screens/auth/widgets/valide_email_text_form_field.dart';
import 'package:doppler/screens/auth/widgets/valide_password_text_form_field.dart';
import 'package:flutter/material.dart';

import 'goto_signup_screen_line.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/SignupScreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String dropdownValue = 'Doctor';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _globalKey,
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
            const SizedBox(height: 20),
            ValideNameTextFormField(name: _name),
            ValideEmailTextFormField(email: _email),
            ValidePasswordTextFormField(password: _password),
            ValidePasswordTextFormField(
              password: _confirmPassword,
              hint: 'Confirm Password',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You are:  ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  iconSize: 24,
                  elevation: 16,
                  dropdownColor: Theme.of(context).primaryColor,
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Doctor', 'User']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SignupButton(
              globalKey: _globalKey,
              name: _name,
              email: _email,
              password: _password,
              confirmPassword: _confirmPassword,
              designation: dropdownValue,
            ),
            const Spacer(),
            const GotoLoginScreenLine(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
