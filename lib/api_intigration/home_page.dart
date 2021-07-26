import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:practice_project/api_intigration/model_class/news_model_class.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles> list = [];

  void getNews() async {
    await http.get(Uri.parse('')).then((value) {
      var parsedData = jsonDecode(value.body);
      list = (parsedData["articles"] as List)
          .map((e) => Articles.fromJson(e))
          .toList();
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
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.yellow,
                ),
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: list.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Article no.${index + 1}",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text("ID = ${list[index].source!.id}"),
                          Text("Name = ${list[index].source!.name}"),
                          Text("Author = ${list[index].author}"),
                          Text("Title = ${list[index].title}"),
                          Text("Description = ${list[index].description}"),
                          Image.network("${list[index].urlToImage}"),
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
