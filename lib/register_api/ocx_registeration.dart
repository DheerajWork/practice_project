import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_project/register_api/global.dart';
import 'package:practice_project/register_api/haha.dart';
import 'package:practice_project/register_api/ocx_login.dart';
import 'package:practice_project/register_api/ocx_login_model_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OcxRegister extends StatefulWidget {
  static String route = "OcxRegister";
  @override
  _OcxRegisterState createState() => _OcxRegisterState();
}

class _OcxRegisterState extends State<OcxRegister> {


  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController id = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? pref;


  Future getRegister()async{
   http.Response response = await http.post(Uri.parse('http://ocx.quiz99.online/api/register'),body: {
     "username":name.text,
     "phone_no":phone.text,
     "country_code":"+91",
     "image":"jhgjj.png",
     "email":email.text,
     "firebase_id":id.text
   });



   var registerData = jsonDecode(response.body);

   print(registerData);

   if(registerData['statusCode'] == 200){
     Global.loginUserData = LoginUserData.fromJson(registerData['data']);
     pref!.setString("UserDetail", jsonEncode(registerData['data']).toString());
     Navigator.of(context).pushNamed(Haha.route);
     print(registerData['message']);
   } else{
     print(registerData['message']);
     SnackBar(content: Text("${registerData['message']}"),);

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    phone.dispose();
    email.dispose();
    id.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: name,
              validator:  (name){
                if (name!.length == 0) {
                  return 'Enter name';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'User Name'
              ),
            ),
            TextFormField(
              controller: phone,
              validator: (phone){
                    if (phone!.isEmpty) {
                      return 'Enter Phone Number!';
                    }
                    return null;
                  },
              decoration: InputDecoration(
                  hintText: 'Phone Number'
              ),
            ),
            TextFormField(
              validator: (email){
                    if (email!.length == 0) {
                      return 'Enter email!';
                    } else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
              controller: email,
              decoration: InputDecoration(
                  hintText: 'Email-id'
              ),
            ),
            TextField(
              controller: id,
              decoration: InputDecoration(
                  hintText: 'Firebase id'
              ),
            ),
            ElevatedButton(
              onPressed: ()async{
                if(_formKey.currentState!.validate()){
                  print("Validation Successful");
                  await getRegister();
                }
              },
              child: Text("Send"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(OcxLogin.route);
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
