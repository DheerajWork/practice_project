import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_project/api_intigration/home_page.dart';
import 'package:practice_project/json/json_posts.dart';
import 'package:practice_project/new_widget/custom_visiblity.dart';
import 'package:practice_project/new_widget/hero.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.pink,
      systemNavigationBarColor: Colors.pink
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
      home: HomePage(),
      routes: {
        'Second Page' : (context) => SecondPage()
      },
    );
  }
}


