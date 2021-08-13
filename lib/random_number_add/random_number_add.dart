import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomNumberAdd extends StatefulWidget {
  @override
  _RandomNumberAddState createState() => _RandomNumberAddState();
}

class _RandomNumberAddState extends State<RandomNumberAdd> {
  int? no1, no2;
  int? answer;
  int? select;
  int? myindex;
  List<int> options = [

  ];


  getNumber() {
    Random num1 = new Random();

    no1 = num1.nextInt(10);
    no2 = num1.nextInt(10);

    answer = no1! + no2!;
    print("$no1+$no2 = $answer");
    options = [answer!,answer!-1,answer!+1,answer!+2];
    options.shuffle();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "What is the Addition of $no1 and $no2",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(options.length, (index) {
                  return AnswerCont(
                    answer: "${options[index]}",
                    color: select==answer && myindex==index?Colors.green:
                    select!=answer && myindex==index?
                    Colors.red:Colors.transparent,
                    onTap: (){
                      myindex =index;
                      select = options[index];
                      print(select);
                     if(options[index]==answer){
                       print("Right");
                     }else{
                       print("Wrong");
                     }
                      setState(() {

                      });
                    },
                  );
                } ),
              ),
              SizedBox(
                height: 30,
              ),
              select==answer?Text("Congratulations!...",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),):SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}



class AnswerCont extends StatelessWidget {

  final String? answer;
  final Color? color;
  final GestureTapCallback? onTap;
  const AnswerCont({Key? key, this.answer, this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(answer!),
          )),
    );
  }
}

