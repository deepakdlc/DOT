import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/usermanagement.dart';

class SignupPage extends StatefulWidget{


  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>{

  String _email;
  String _password;


  Widget build (BuildContext context){
    return Scaffold(

      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(

                decoration: InputDecoration(
                  helperText: 'Ex: thinkdeep099064@gmail.com',
                  labelText: 'Email',
                  hintText: 'Enter Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),

                onChanged: (value){
                  setState(() {
                   _email = value; 
                  });
                },
              ),

              SizedBox(height: 15.0,),
               TextField(

                decoration: InputDecoration(
                  helperText: 'Ex: ABC@#\$123',
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                obscureText: true,
                onChanged: (value){
                  setState(() {
                   _password = value; 
                  });
                },
                ),

              SizedBox(height: 20.0,),
              RaisedButton(child: Text('SignUp'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){

                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email,
                    password: _password
                  ).then((signedinuser){
                    UserManagement().storenewuser(signedinuser,context);
                  }).catchError((e){
                    print(e);
                  });
              },

              ),

            ],
            )
        ),
      ));
  }
}
