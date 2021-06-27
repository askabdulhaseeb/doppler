import 'package:flutter/material.dart';
import 'screens/auth/loginScreen/login_screen.dart';
import 'screens/auth/signupScreen/signup_screen.dart';
import 'screens/homeScreen/home_screen.dart';
import 'screens/splashScreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doppler',
      darkTheme: ThemeData.dark(),
      color: Colors.green,
      theme: ThemeData(
        hintColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        accentColor: Colors.green,
        buttonColor: Colors.green,
        canvasColor: Colors.greenAccent,
        indicatorColor: Colors.lightGreen,
        primaryColorDark: Colors.green,
        highlightColor: Colors.green,
        focusColor: Colors.green,
        hoverColor: Colors.green,
        splashColor: Colors.lightGreen,
        dividerColor: Colors.grey,
        primaryColorLight: Colors.green,
        disabledColor: Colors.grey,
        errorColor: Colors.red,
      ),
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
