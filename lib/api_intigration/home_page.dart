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
      list = (parsedData["articles"] as List).map((e) => Articles.fromJson(e)).toList();
      print(list[0]);
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
        body: list.isEmpty?Center(child: CircularProgressIndicator(),):Container(
          child: ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${index+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ],
                ),
                Text("ID = ${list[index].source!.id}"),
                Text("Name = ${list[index].source!.name}"),
                Text("Author = ${list[index].author}"),
                Text("Title = ${list[index].title}"),
                Text("Description = ${list[index].description}"),
                list.isEmpty?CircularProgressIndicator():Image.network("${list[index].urlToImage}"),
                Text("Published At = ${list[index].publishedAt}"),
                Text("Content = ${list[index].content}"),
                SizedBox(
                  height: 40,
                )
              ],
            );
          }),
        ));
  }
}
