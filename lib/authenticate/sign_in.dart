import 'package:flutter/material.dart';
import 'package:sherpa_app/services/auth.dart';
import 'package:sherpa_app/Pages/HomePage.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('Sign in to sherpa'),
      ),
      body: Container
        (
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ElevatedButton(
            child: Text('Sign in anon'),
            onPressed: () async
            {
              dynamic result = await _auth.signInAnon();
              if(result== null){print('error signing in');}
              else
                {
                  print('signed in');
                  print(result.uid);
                }
            },
          )
        ),
    );
  }
}
