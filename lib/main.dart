import 'package:flutter/material.dart';
import 'package:practice_project/packages/svg.dart';
import 'package:practice_project/register_api/haha.dart';
import 'package:practice_project/register_api/login_api.dart';
import 'package:practice_project/register_api/ocx_login.dart';
import 'package:practice_project/register_api/ocx_registeration.dart';
import 'package:practice_project/register_api/register_api.dart';
import 'package:practice_project/web_api/web_api_testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    routes: {
      RegistrationApi.route:(context) =>RegistrationApi(),
      Haha.route:(context) =>Haha(),
      LoginApi.route:(context) =>LoginApi(),
      OcxLogin.route:(context) =>OcxLogin(),
      OcxRegister.route : (context) => OcxRegister()
    },
    home: Packages(),
    );
  }
}

























class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  SharedPreferences? pref;

  setValue()
  async {
    pref =await SharedPreferences.getInstance();
    if(pref!.getInt("counter") !=null)
      {

        _counter = pref!.getInt("counter")!;
        print(_counter);
      }
    else{
      pref!.setInt("counter", _counter);
      print(_counter);
    }
    setState(() {

    });
  }
  void _incrementCounter() {
    setState(() {

      _counter++;
      pref!.setInt("counter", _counter);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    setValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
