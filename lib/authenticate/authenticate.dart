import 'package:flutter/material.dart';
import 'package:sherpa_app/authenticate/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Container(
      child: SignIn(),
    );
  }
}
