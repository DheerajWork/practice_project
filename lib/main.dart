import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:practice_project/image_picker/image_picker.dart';

import 'package:practice_project/new_widget/hero.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.yellow,
      systemNavigationBarColor: Colors.red
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: TestImagePicker(),
      routes: {
        'Second Page' : (context) => SecondPage()
      },
    );
  }
}


