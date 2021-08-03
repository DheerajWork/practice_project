import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginApi extends StatefulWidget {
  @override
  _LoginApiState createState() => _LoginApiState();
}

class _LoginApiState extends State<LoginApi> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  Future registrationUser ()async{
    String APIURL = "http://shaybani.quiz99.online/api/login";

    Map mapAdd = {
      'email': _email.text,
      'password': _password.text,
      'photo': "ss",
    };

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
      Navigator.of(context).pushNamed('Home Page');
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
              registrationUser();

            }, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
