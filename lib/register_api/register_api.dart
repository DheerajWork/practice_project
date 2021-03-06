import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_project/register_api/login_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationApi extends StatefulWidget {
  static String route = "RegistrationApi";

  @override
  _RegistrationApiState createState() => _RegistrationApiState();
}

class _RegistrationApiState extends State<RegistrationApi> {

  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? preferences;

  Future registrationUser ()async{
    String APIURL = "http://shaybani.quiz99.online/api/register";

    Map mapAdd = {
      'name': _name.text,
      'phone': _phone.text,
      'email': _email.text,
      'password': _password.text,
      'photo': "ss",
    };

    preferences!.setString("name", _name.text);
    preferences!.setString("phone", _phone.text);
    preferences!.setString("email", _email.text);
    preferences!.setString("pass", _password.text);

    print("JSON DATA $mapAdd");

    http.Response response = await http.post(Uri.parse(APIURL),body: mapAdd);

    print(response.body);

    var data = jsonDecode(response.body);

    print("Data $data");

    if(response.statusCode == 200){
      Navigator.of(context).pushReplacementNamed(LoginApi.route);
    } else{
      print("${data['message']}");
    }

  }

  getShared() async {
    preferences = await SharedPreferences.getInstance();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShared();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name'
                ),
                controller: _name,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'phone'
                ),
                controller: _phone,
              ),
              SizedBox(
                height: 20,
              ),
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
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, LoginApi.route);
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
