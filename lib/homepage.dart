import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Name'),
      accountEmail: Text('Email@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: Image.asset('assets/logo.jpg'),
        radius: 24.0,
        backgroundColor: Colors.white,
      ),

      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Image.asset('assets/logo.jpg'),
          radius: 10.0,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          child: Image.asset('assets/logo.jpg'),
          radius: 10.0,
          backgroundColor: Colors.white,
        ),
      ],
    );

    final draweritems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('Home'),
          onTap: ()=> Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          )
        ),
        ListTile(
          title: Text('My Data'),
          onTap: ()=> Navigator.of(context).pushReplacementNamed('/'),
        ),

      ],
    );





    return new Scaffold(
      drawer: Drawer(

        child: draweritems,
      ),
      appBar: AppBar(
        actions: <Widget>[

          OutlineButton(
                borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 2.0,
                ),
                child: Text('logout'),
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((value){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }).catchError((e){
                    print(e);
                  });
                },
              ),
            ],
           /*  */
        ),

        body: Container(
          child: Text('hi'),
          color: Colors.blue,
        ),

      );
    }
  }
