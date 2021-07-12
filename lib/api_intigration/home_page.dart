import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_project/api_intigration/constants/strings.dart';
import 'package:practice_project/api_intigration/model_class/news_model_class.dart';
import 'package:practice_project/api_intigration/services/api_manager.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles> list = [];

  void getNews() async {
    await http.get(Uri.parse(MyStrings.news_url)).then((value) {
      var parsedData = jsonDecode(value.body);
      list = (parsedData["articles"] as List)
          .map((e) => Articles.fromJson(e))
          .toList();
      print(list);
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              height: 100,
            );
          }),
        ));
  }
}
