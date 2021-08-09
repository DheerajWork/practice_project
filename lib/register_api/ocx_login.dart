import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_project/register_api/global.dart';
import 'package:practice_project/register_api/haha.dart';
import 'package:practice_project/register_api/ocx_login_model_class.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OcxLogin extends StatefulWidget {
  static String route = "OcxLogin";

  @override
  _OcxLoginState createState() => _OcxLoginState();
}

class _OcxLoginState extends State<OcxLogin> {
  SharedPreferences? pref;

  TextEditingController phone = TextEditingController();
  TextEditingController id = TextEditingController();


  getLogin()async{
    http.Response response = await http.post(Uri.parse('http://ocx.quiz99.online/api/login'),body: {
      "firebase_id":id.text,
      "country_code":"+91",
      "phone_no": phone.text
    });



    var loginData = jsonDecode(response.body);

    if(loginData['statusCode'] == 200){
      print(loginData['message']);
      Global.loginUserData = LoginUserData.fromJson(loginData['data']);
      pref!.setString("UserDetail", jsonEncode(loginData['data']).toString());
      Navigator.of(context).pushNamed(Haha.route);
      print(loginData);
    } else{
      // Fluttertoast.showToast(msg: loginData['message']);
      SnackBar(content: Text("${loginData['message']}"),);
    }

  }
  getPref ()async{
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: phone,
              decoration: InputDecoration(
                  hintText: 'Phone Number'
              ),
            ),
            TextField(
              controller: id,
              decoration: InputDecoration(
                  hintText: 'Firebase id'
              ),
            ),
            ElevatedButton(
              child: Text("Enter"),
              onPressed: (){

                getLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
