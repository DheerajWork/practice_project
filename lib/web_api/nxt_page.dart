import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:practice_project/web_api/web_api_global.dart';

class NxtPage extends StatefulWidget {
  @override
  _NxtPageState createState() => _NxtPageState();
}

class _NxtPageState extends State<NxtPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("${WebGlobal.webApi!.title!.rendered}"),
          Html(data: "${WebGlobal.webApi!.content!.rendered}",)
        ],
      ),
    );
  }
}
