import 'package:doppler/configs/app_image.dart';
import 'package:doppler/screens/auth/loginScreen/sheet/login_sheet.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
          const LoginSheet(),
        ],
      ),
    );
  }
}
