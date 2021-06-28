import 'package:doppler/configs/app_image.dart';
import 'package:doppler/screens/user/scanXrayScreen/scan_xray_screen.dart';
import 'package:doppler/screens/user/uploadXRayScreen/upload_xray_screen.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  static const roouteName = '/UsserHomeScreen';
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const UserHomeHeader(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ScanXRayScreen.routeNAme);
                  },
                  child: const UserHomeScreenIconsWidget(
                    icon: Icons.camera_alt_outlined,
                    title: 'Scan XRay',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(UploadXRayScreen.routeName);
                  },
                  child: const UserHomeScreenIconsWidget(
                    icon: Icons.upload_file,
                    title: 'Upload XRay',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const UserHomeScreenIconsWidget(
                    icon: Icons.medical_services_outlined,
                    title: 'View Report',
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const UserHomeScreenIconsWidget(
                    icon: Icons.list_alt,
                    title: 'Add Media History',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const UserHomeScreenIconsWidget(
                icon: Icons.comment,
                title: 'Queries',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserHomeScreenIconsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const UserHomeScreenIconsWidget({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          Text(
            '''$title''',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class UserHomeHeader extends StatelessWidget {
  const UserHomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            child: Image(
              image: AssetImage(iAppLogo),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello, Salman',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('''How's you today?'''),
            ],
          ),
        ],
      ),
    );
  }
}
