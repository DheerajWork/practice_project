import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice_project/register_api/haha.dart';
import 'package:practice_project/register_api/register_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? pref;
  static String? userName;
  static String? emailId;
  static String? phoneNumber;

  getUserDetails() async {
    pref = await SharedPreferences.getInstance();

    if (pref!.getString('name') != null &&
        pref!.getString('email') != null &&
        pref!.getString('phone') != null) {
      userName = pref!.getString('name');
      emailId = pref!.getString('email');
      phoneNumber = pref!.getString('phone');

      print(userName);
      print(emailId);
      print(phoneNumber);
      print("Direct Login");
      Navigator.of(context).pushNamed(Haha.route);
    } else{
      print("Enter Register Screen");
      Navigator.of(context).pushReplacementNamed(RegistrationApi.route);
    }
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
