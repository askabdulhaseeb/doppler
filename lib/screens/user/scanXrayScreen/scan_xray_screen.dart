import 'dart:io';

import 'package:doppler/screens/user/scanXrayScreen/upload_image_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanXRayScreen extends StatefulWidget {
  static const routeNAme = '/ScanXRayScreen';
  const ScanXRayScreen({Key? key}) : super(key: key);
  @override
  _ScanXRayScreenState createState() => _ScanXRayScreenState();
}

class _ScanXRayScreenState extends State<ScanXRayScreen> {
  PickedFile? _image;
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              _imgFromCamera();
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: _image != null
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.file(
                        File(_image!.path),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        width: 120,
                        height: 120,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 80,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 20),
          const UploadImageButton(),
        ],
      ),
    );
  }

  _imgFromCamera() async {
    final ImagePicker _imagePicker = ImagePicker();
    final PickedFile? _file = await _imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      _image = _file;
    });
  }
}
