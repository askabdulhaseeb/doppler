import 'package:doppler/screens/user/userHomeScreen/user_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/admin/homeScreen/home_screen.dart';
import 'screens/auth/loginScreen/login_screen.dart';
import 'screens/auth/signupScreen/signup_screen.dart';
import 'screens/splashScreen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const UserHomeScreen(),
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
        AdminHomeScreen.routeName: (_) => const AdminHomeScreen(),

        // users
        UserHomeScreen.roouteName: (_) => const UserHomeScreen(),
      },
    );
  }
}


// Certificate fingerprints:
//    SHA1: F6:3C:6E:07:37:98:D1:37:8D:8D:AD:2B:80:BE:5E:2C:50:EF:71:F9
//    SHA256: B8:1F:B2:FF:CB:2E:A2:45:12:1B:22:43:35:C5:B6:CC:A5:3B:CE:D4:6B:97:93:EF:76:D9:81:0F:F9:16:4C:6E