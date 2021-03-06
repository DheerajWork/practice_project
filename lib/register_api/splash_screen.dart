import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_project/register_api/global.dart';
import 'package:practice_project/register_api/haha.dart';
import 'package:practice_project/register_api/ocx_login_model_class.dart';
import 'package:practice_project/register_api/ocx_registeration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences? pref;

  getUserDetails() async {
    pref = await SharedPreferences.getInstance();
    String? a = pref!.getString("UserDetail");
    print(a);
    if (pref!.getString("UserDetail") !=null) {
      Global.loginUserData = LoginUserData.fromJson(jsonDecode(a!));
      Navigator.of(context).pushNamed(Haha.route);
    } else {
      Navigator.of(context).pushNamed(OcxRegister.route);
    }
  }


  startTime() async {
    var _duration = new Duration(seconds: 5);
     Timer(_duration, navigationPage);
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
