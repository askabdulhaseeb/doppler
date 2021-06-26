import 'dart:async';

import 'package:doppler/configs/app_image.dart';
import 'package:doppler/screens/auth/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(LoginScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(iAppLogo), fit: BoxFit.fill),
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
          const SizedBox(height: 10),
          const Text(
            'PROVIDING MEDICAL SOLUTIONS',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
