import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_project/web_api/nxt_page.dart';
import 'package:practice_project/web_api/web_api_global.dart';
import 'package:practice_project/web_api/web_api_model.dart';

class WebApiTesting extends StatefulWidget {
  @override
  _WebApiTestingState createState() => _WebApiTestingState();
}

class _WebApiTestingState extends State<WebApiTesting> {

  List<WebApi>? list = [];

  myData() async {
    list = await WebGlobal.getData();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
              itemCount: list!.length,
              itemBuilder: (c,i){
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      WebGlobal.webApi = list![i];
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> NxtPage()));
                    },
                    child: Row(
                      children: [
                        Image.network("${list![i].featuredMedia!.medium}",height: 70,width: 70,),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text("${list![i].title!.rendered}"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
              }
          )
      ),
    );
  }
}






