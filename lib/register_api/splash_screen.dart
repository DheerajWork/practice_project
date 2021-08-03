import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice_project/api_intigration/home_page.dart';
import 'package:practice_project/phone_authentication/home_screen.dart';
import 'package:practice_project/register_api/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? preferences;

  getUserDetails() async {
    preferences = await SharedPreferences.getInstance();

    if (preferences!.getString("name") != null &&
        preferences!.getString("phone") != null &&
        preferences!.getString("email") != null) {

      Global.userName = preferences!.getString('name');
      Global.phoneNumber = preferences!.getString('phone');
      Global.emailId = preferences!.getString('email');

      print("Name ::: ${Global.userName}");
      print("phone ::: ${Global.phoneNumber}");
      print("email ::: ${Global.emailId}");

      Global.userData = {
        "name" : preferences!.getString("name"),
        "phone_no" : preferences!.getString("phone"),
        "email" : preferences!.getString("email"),
      };
      print("Global User Login Is DONE!!!!");
      print("Enter Home With Login");
      Navigator.of(context).pushReplacementNamed('Home Page');

    } else {
      print("Enter Register Screen");
      Navigator.of(context).pushReplacementNamed('Register Api');

    }


    // if (preferences != null) {
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (c) => HomePage()), (route) => false);
    // }
  }


  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    getUserDetails();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello Guys...!",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 250),
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
