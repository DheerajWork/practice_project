import 'dart:convert';
import 'package:flutter/material.dart';

class StudentData{

  int? enrollmentNumber;
  String? name;
  int? attendance;
  int? marks;

  StudentData({this.name,this.attendance,this.enrollmentNumber,this.marks});

  StudentData.fromjson(Map<String, dynamic> json) {
    enrollmentNumber = json['enrollmentNumber'];
    name = json['name'];
    attendance = json['attendance'];
    marks = json['marks'];
  }

}

  getData(){
    String data = '{"name": "Dheeraj","enrollmentNumber": 1010,"attendance": 100,"marks": 50}';

    var parsedData = jsonDecode(data);

    print(parsedData["marks"]);

    StudentData s1 = StudentData.fromjson(parsedData);

    print("Marks :::::::::: ${s1.marks}");

  }

class GetNumber extends StatefulWidget {
  @override
  _GetNumberState createState() => _GetNumberState();
}

class _GetNumberState extends State<GetNumber> {

  String data = '{"name": "Dheeraj","enrollmentNumber": 1010,"attendance": 100,"marks": 50}';

  StudentData s1 = StudentData(marks: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            s1.marks =10;
            getData();
            setState(() {

            });
          }, child: Text('')),
          SizedBox(
            height: 20,
          ),
          Text('${s1.marks}')
        ],
      ),
    );
  }
}
