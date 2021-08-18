import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class Packages extends StatefulWidget {
  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //svg packages
              SvgPicture.asset(
                "assets/1627640231desert-landscape-nature-clip-art.svg",
                width: 150,
                height: 150,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Animated Text Example',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  )
                ],
                totalRepeatCount: 2,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              Text(
                "Flutter Examples",
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                  onPressed: () async {
                    await canLaunch(
                            "https://pub.dev/packages/url_launcher/example")
                        ? await launch(
                            "https://pub.dev/packages/url_launcher/example")
                        : throw 'Could not launch';
                  },
                  icon: Icon(Icons.link),
                  label: Text("Open Link")),
              ElevatedButton(
                child: const Text('showModalBottomSheet'),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.amber,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('My BottomSheet'),
                              ElevatedButton(
                                child: const Text('For Close'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ExpansionTile(
                title: Text(
                  "Title",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
              GridView.count(
                shrinkWrap: true,
                  crossAxisCount: 2,
              children:
                List.generate(6, (index) {
                  return Center(
                    child: Text("$index"),
                  );
                } )

              )
            ],
          ),
        ),
      ),
    );
  }
}
