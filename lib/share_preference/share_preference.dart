import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_project/share_preference/pref_model_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharePref extends StatefulWidget {
  @override
  _MySharePrefState createState() => _MySharePrefState();
}

class _MySharePrefState extends State<MySharePref> {
  SharedPreferences? pref;
  int num = 0;
  // PrefModelClass? prefModelClass = PrefModelClass(a: jsonDecode("a"));

  setNum() async {
    pref = await SharedPreferences.getInstance();

    if (pref!.getInt('num') != null) {
    num = pref!.getInt('num')!;

      print(num);
    } else {
      pref!.setInt('num', num);

      print(num);
    }
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     setNum();
     // print(prefModelClass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('$num',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // num++;
                    pref!.setInt('num',num);
                  });
                },
                child: Text('$num')),

            Transform(
              transform: Matrix4.rotationZ(0.5-11),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Transform(
              transform: Matrix4.rotationZ(0.5-20),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
