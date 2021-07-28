import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice_project/phone_authentication/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class UserNumberLogin extends StatefulWidget {
  @override
  _UserNumberLoginState createState() => _UserNumberLoginState();
}

class _UserNumberLoginState extends State<UserNumberLogin> {

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  String? phoneNo, smssend, _verificationId;

  Future<void> loginUser(String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          
          Navigator.of(context).pop();
          var result = await _auth.signInWithCredential(credential);

          var user = result.user;

          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
          else{
            print("Error");
          }
        },
        verificationFailed: (var exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int? forceResendingToken]){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Give the code"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _codeController,
              )
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: ()
                async{
                  print("111111111111111111");
              var credential = PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: _codeController.text);
             UserCredential user= await _auth.signInWithCredential(credential);

             if(user.user!=null){
               Navigator.push(
                   context, MaterialPageRoute(builder: (context) => HomeScreen()));
             }

              _verificationId = verificationId;
              print("00000000000000000000000");
            }, child: Text("Confirm"))
          ],
        );
      },barrierDismissible: false);
        },
          codeAutoRetrievalTimeout: (String verificationId) {
            print("verification code: " + verificationId);
            //showSnackbar("verification code: " + verificationId);
            _verificationId = verificationId;
          },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: "Enter Your Phone Number"
                ),
                onChanged: (value) {
                  this.phoneNo = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){

                loginUser(_phoneController.text);
              }, child: Text("Verify"))
            ],
          ),
        ),
      ),
    );
  }
}
