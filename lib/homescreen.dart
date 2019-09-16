import 'package:flutter/material.dart';
import 'dart:async';
import 'loginpage.dart';



class logo extends StatefulWidget{

  _logoState createState() => _logoState();
}


class _logoState extends State<logo>{

  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    },);
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Image.asset('assets/logo2.png',
                          height: 100.0, width: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        "DOT",style: TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold,fontFamily: 'ruby' ),
                      )
                    ],
                  ),
                ),
              ),
            ],),
    );

  }
}




