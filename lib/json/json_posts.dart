import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_project/json/model_class/user_posts.dart';

class JsonPosts extends StatefulWidget {
  @override
  _JsonPostsState createState() => _JsonPostsState();
}

class _JsonPostsState extends State<JsonPosts> {
  String text = ('Json');
  List<UserPosts> list = [];

  Future getData() async {
    await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
        .then((value) {
      Iterable parseData = jsonDecode(value.body);
      list = List<UserPosts>.from(parseData.map(
        (e) => UserPosts.fromJson(e),
      ));
      print(list[5].userId);
      setState(() {});
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              children: List.generate(
                  1,
                  (index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User = ${list[1].userId}'),
                          Text('ID = ${list[1].id}'),
                          Text('Title = ${list[1].title}'),
                          Text('Body = ${list[1].body}')
                        ],
                      ))),
        ),
      ),
    );
  }
}
