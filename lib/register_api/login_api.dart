import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice_project/register_api/haha.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi extends StatefulWidget {
  static String route = "LoginApi";

  @override
  _LoginApiState createState() => _LoginApiState();
}

class _LoginApiState extends State<LoginApi> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  SharedPreferences? preferences;


  Future loginUser ()async{
    String APIURL = "http://shaybani.quiz99.online/api/login";

    Map mapAdd = {
      'email': _email.text,
      'password': _password.text,
      'photo': "ss",
    };

    preferences!.setString("email", _email.text);
    preferences!.setString("pass", _password.text);

    print("JSON DATA $mapAdd");

    http.Response response = await http.post(Uri.parse(APIURL),body: mapAdd);

    print(response.body);

    var data = jsonDecode(response.body);

    if(response.statusCode == 200){
      Fluttertoast.showToast(
          msg: "${data['message']}",gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          toastLength: Toast.LENGTH_LONG

      );
      Navigator.of(context).pushReplacementNamed(Haha.route);
    } else{
      Fluttertoast.showToast(
          msg: "Something went wrong",gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          toastLength: Toast.LENGTH_LONG
      );
      print("${data['message']}");
    }

    print("Data $data");

  }

  getLogin() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'email'
              ),
              controller: _email,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
              controller: _password,
            ),

            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: (){
              loginUser();

            }, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
