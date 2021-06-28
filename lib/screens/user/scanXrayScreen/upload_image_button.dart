import 'package:doppler/screens/user/userHomeScreen/user_home_screen.dart';
import 'package:doppler/screens/widgets/show_loading.dart';
import 'package:flutter/material.dart';

class UploadImageButton extends StatelessWidget {
  const UploadImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () async {
        showLoadingDislog(context);
        // uploading image to Firebase
        Navigator.of(context).pop();

        Navigator.of(context).pushNamedAndRemoveUntil(
          UserHomeScreen.roouteName,
          (route) => false,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Text(
          'Uploade Image',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
