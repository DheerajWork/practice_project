import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatefulWidget {
  @override
  _HeroWidgetState createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,'Second Page' );
                },
                child: Container(
                  width: 200,
                    height: 200,
                    child: Hero(
                        tag: 'hero',
                        child: InteractiveViewer(child: Image.network('https://images.pexels.com/photos/7011542/pexels-photo-7011542.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')))),
              )
            ],
          )
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AnimationController>('controller', controller));
  }
}


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 500,
              width: 100,
              child: Hero(
                  tag: 'hero',
                  child: Column(
                    children: [
                      Image.network('https://images.pexels.com/photos/7011542/pexels-photo-7011542.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

