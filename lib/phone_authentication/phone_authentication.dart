import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice_project/phone_authentication/home_screen.dart';
import 'package:practice_project/register_api/global.dart';

class UserNumberLogin extends StatefulWidget {
  @override
  _UserNumberLoginState createState() => _UserNumberLoginState();
}

class _UserNumberLoginState extends State<UserNumberLogin> {

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  String? phoneNo,_verificationId;

  Future<void> loginUser(String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
        timeout: Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {

          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          var user = result.user;

          if (user != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
          else{
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, int? forceResendingToken){
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
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,smsCode: _codeController.text);
             UserCredential user = await _auth.signInWithCredential(credential);
                 Global.uid = user.user!.uid;
             print(user.user!.uid);

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
            _verificationId = verificationId;
          },
    );
  }


  // Future <void> loginUser ()async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: _phoneController.text,
  //       verificationCompleted: (var i){},
  //       verificationFailed: (var i){
  //         print(i);
  //       },
  //       codeSent: (String verificationId, [int? forceResendingToken]){
  //         showDialog(context: context,
  //             builder: (context){
  //           return AlertDialog(
  //             title: Text("Code"),
  //
  //           );
  //             }
  //         )
  //       },
  //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
  //   )
  //
  // }



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
