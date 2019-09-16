import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();


class LoginPage extends StatefulWidget{


  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  String _email;
  String _password;
  bool _success;
  String _userID;


  Widget build (BuildContext context){
    return Scaffold(

      body: Center(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.asset('assets/logo2.png',
                height: 100.0, width: 80.0,
              ),
          Text(
            "DOT",style: TextStyle(color: Colors.blue,fontSize: 50.0,fontWeight: FontWeight.bold,fontFamily: 'ruby' ),
          ),
              SizedBox(height: 60.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Email',
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
                   labelText: 'Password',
                   hintText: 'Enter Password',
                   contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                 ),
                onChanged: (value){
                  setState(() {
                   _password = value; 
                  });
                },
                obscureText: true,
                ),

              SizedBox(height: 20.0,),
              RaisedButton(child: Text('login'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _email,
                  password: _password
              ).then((FirebaseUser user){
                Navigator.of(context).pushReplacementNamed('/homepage');
              }).catchError((e){
                print(e);
              });
              },
              ),

              SizedBox(height: 15.0,),
              Text('Don\'t have an account'),
              FlatButton(
                child: Text('Click here'),

                textColor: Colors.blue,
                onPressed: (){

                  Navigator.of(context).pushNamed('/signup');



                },
                ),
              Text('Or',textAlign: TextAlign.center,),
              Text(' Login With'),
              Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      child: Image.asset('assets/google.png',width: 50.0,height: 50.0,),
                      elevation: 10.0,
                      onPressed: (){
                        _signInWithGoogle();


                      },
                    ),

                    RawMaterialButton(
                      child: Image.asset('assets/phone.png',width: 50.0,height: 50.0,),
                      elevation: 7.0,
                      onPressed: (){
                        Navigator.of(context).pushNamed('/phoneauth');
                      },
                    ),

                  ],
                ),
              ),
            ],
            )
        ),
      ));
  }
  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _success = true;
        _userID = user.uid;
      } else {
        _success = false;
      }
    });
    if(_success == true)
    {
      Navigator.of(context).pushReplacementNamed('/homepage');

    }else{
      MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}



