import 'package:doppler/configs/app_image.dart';
import 'package:doppler/screens/auth/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _textStyle = TextStyle(color: Colors.black);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(iAppLogo),
              backgroundColor: Colors.black,
            ),
            const SizedBox(height: 10),
            const Text(
              'Admin',
              style: _textStyle,
            ),
            const SizedBox(height: 30),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text(
                'Home',
                style: _textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.perm_contact_cal, color: Colors.black),
              title: const Text(
                'Manage User',
                style: _textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.comment, color: Colors.black),
              title: const Text(
                'Manage Queries',
                style: _textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text(
                'Settings',
                style: _textStyle,
              ),
              onTap: () {},
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text(
                'Logout',
                style: _textStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
