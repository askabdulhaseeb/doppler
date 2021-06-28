import 'package:doppler/database/user_local_data.dart';
import 'package:doppler/screens/admin/adminDrawer/admin_drawer.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  static const routeName = '/AdminHomeScreen';
  const AdminHomeScreen({Key? key}) : super(key: key);
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello ',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: AdminDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Text(
            //   'Hello ${UserLocalData.getUserDisplayName()}',
            //   overflow: TextOverflow.ellipsis,
            //   style: const TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
