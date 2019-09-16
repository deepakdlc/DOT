import 'package:flutter/material.dart';
import 'homepage.dart';
import 'signuppage.dart';
import 'services/phoneauth.dart';
import 'homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: logo(),
      routes: <String,WidgetBuilder>{
        '/landing':(BuildContext context) => new MyApp(),
        '/signup':(BuildContext context) => new SignupPage(),
        '/homepage':(BuildContext context) => new HomePage(),
        '/phoneauth':(BuildContext context) => new PhoneAuth(),
      },

    );
  }
}



