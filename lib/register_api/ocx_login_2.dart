import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ocx_login_model_class.dart';

class OcxLogin2 extends StatefulWidget {
  @override
  _OcxLogin2State createState() => _OcxLogin2State();
}

class _OcxLogin2State extends State<OcxLogin2> {

  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();

  LoginUserData user = LoginUserData();

  getLogin()async{

    Map mapAdd = {
      'phone_no': phone.text,
      'country_code': code.text,
      "firebase_id":"dheerajsdfsdfsg",
    };

    http.Response response = await http.post(Uri.parse('http://ocx.quiz99.online/api/login'),
    body: mapAdd);

    print(response.body);



    var data = jsonDecode(response.body);
    //
    // if(response.statusCode == 200){
    //   print(data['data']);
    // } else{
    //   print(data['message']);
    // }
    if (data['statusCode'] == 200) {
     user = LoginUserData.fromJson(data['data']);

      // print("Email   ${data['data']['email']}");
      // print("UserName   ${data['data']['username']}");
      // print("PhoneNumber    ${data['data']['phone_no']}");
      // print("Code    ${data['data']['country_code']}");
      // print("image   ${data['data']['image']}");
      print(user.username);
      print(user.email);
      print('------------------------------------');
    } else{
      print("Invalid");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: phone,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: code,
          ),
          ElevatedButton(onPressed: (){
            getLogin();
            setState(() {

            });
          }, child: Text('Enter')),
          SizedBox(
            height: 20,
          ),
          user.username != null? Column(
            children: [
              Text("${user.username}"),
              Text("${user.phoneNo}"),
              Text("${user.email}"),
              Text("${user.countryCode}"),
            ],
          ): Text("")
        ],
      ),
    );
  }
}
