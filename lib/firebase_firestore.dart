import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserDataStore extends StatefulWidget {
  @override
  _UserDataStoreState createState() => _UserDataStoreState();
}

class _UserDataStoreState extends State<UserDataStore> {

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: (){

              // FirebaseFirestore.instance.collection("User").add({
              //   "name": name.text,
              //   "city":"Ajmer"
              // });

              FirebaseFirestore.instance.collection("User").doc("74UxhTwsPs2QAhx4Fdy5").update({
                "name": name.text,
                "city":"Flutter"
              });
            }, child: Text("Send"))
          ],
        ),
      )),
    );
  }
}
