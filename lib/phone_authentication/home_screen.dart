import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice_project/register_api/global.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name.text),
              TextField(
                controller: name,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("User")
                        .doc(Global.uid)
                        .set({"name": name.text, "city": "Ajmer"});
                    setState(() {});

                    print(Global.uid);
                    print("****************************");
                  },
                  child: Text("send")),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    print(Global.uid);
                    print("****************************");
                    FirebaseFirestore.instance
                        .collection("User")
                        .doc(Global.uid)
                        .update({"name": name.text, "city": "Flutter"});
                    setState(() {});
                  },
                  child: Text("update")),
            ],
          ),
        )),
      ),
    );
  }
}
