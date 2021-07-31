import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_project/new_widget/hero.dart';
import 'package:practice_project/phone_authentication/phone_authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_project/register_api/login_api.dart';
import 'package:practice_project/register_api/register_api.dart';

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
      home: LoginApi(),
      routes: {
        'Second Page' : (context) => SecondPage()
      },
    );
  }
}


