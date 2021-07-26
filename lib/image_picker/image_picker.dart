import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class TestImagePicker extends StatefulWidget {
  @override
  _TestImagePickerState createState() => _TestImagePickerState();
}

class _TestImagePickerState extends State<TestImagePicker> {

  final ImagePicker picker = ImagePicker();
   File? urlImage;
   String? url;
  getImage() async{
    XFile? imagePick = await picker.pickImage(source: ImageSource.gallery
      ,);
     urlImage = File(imagePick!.path);
     url = urlImage!.path;
    setState(() {

    });
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
               urlImage==null ? Icon(Icons.add): Image.file(urlImage!),
                ElevatedButton(
                  onPressed: (){
                    getImage();
                  }, child: Text("Click"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
