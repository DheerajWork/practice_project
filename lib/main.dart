import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:practice_project/image_picker/image_picker.dart';

import 'package:practice_project/new_widget/hero.dart';
import 'package:practice_project/phone_authentication/phone_authentication.dart';
import 'package:practice_project/random_number_add/random_number_add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: UserNumberLogin(),
      routes: {
        'Second Page' : (context) => SecondPage()
      },
    );
  }
}


