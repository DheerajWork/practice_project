import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practice_project/json/model_class/user_comments.dart';

class Json extends StatefulWidget {
  @override
  _JsonState createState() => _JsonState();
}

class _JsonState extends State<Json> {

  Future getData() async {
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments")).then((value) {
      Iterable parseData = jsonDecode(value.body);
      List<UserComments> list = List<UserComments>.from(parseData.map(
        (e) => UserComments.fromJson(e),
      ));
      print(list[2]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
