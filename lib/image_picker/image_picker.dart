import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class TestImagePicker extends StatefulWidget {
  @override
  _TestImagePickerState createState() => _TestImagePickerState();
}

class _TestImagePickerState extends State<TestImagePicker> {
  final ImagePicker picker = ImagePicker();
  File? urlImage;
  String? url;
  File? croppedFile;

  getImage() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    urlImage = File(pickedFile!.path);
    url = urlImage!.path;
    if (url != null) {
      croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
      setState(() {});
      if (croppedFile != null) {
        setState(() {
          urlImage = croppedFile!.path as File?;
        });
      }
    }
    setState(() {});
    print("ImagePick :::::: $url");
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                croppedFile == null
                    ? Icon(Icons.add)
                    : Image.file(croppedFile!),
                ElevatedButton(
                  onPressed: () {
                    getImage();
                    setState(() {});
                  },
                  child: Text("Click"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




