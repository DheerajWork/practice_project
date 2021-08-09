import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharePref extends StatefulWidget {
  @override
  _MySharePrefState createState() => _MySharePrefState();
}

class _MySharePrefState extends State<MySharePref> {
  int num = 0;
  SharedPreferences? pref;

  setNum() async {
    pref = await SharedPreferences.getInstance();

    if (pref!.getInt('num') != null) {
      num = pref!.getInt('num')!;

      print(num);
    } else {
      pref!.setInt('num', num);

      print(num);
    }
  }

  addNum() {
    setState(() {
      num++;
      pref!.setInt('num', num);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setNum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Text('$num',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ElevatedButton(
                onPressed: () {
                  addNum();
                  setState(() {});
                },
                child: Text('$num'))
          ],
        ),
      ),
    );
  }
}
