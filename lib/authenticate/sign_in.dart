import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sherpa_app/services/auth.dart';
import 'package:sherpa_app/shared/loading.dart';

import '../models/user.dart';

class SignIn extends StatefulWidget {
  final Function? toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            /*appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
      ),*/
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      //USERNAME
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Color(0xffFEE2E2),
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffFEE2E2), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffFEE2E2), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    TextFormField(
                      //PASSWORD
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Color(0xffFEE2E2),
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffFEE2E2), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffFEE2E2), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Password incorrect' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                        child: Text('Sign in'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            try {
                              await _auth.signInWithEmailAndPassword(
                                email,
                                password,
                              );
                            } on FirebaseAuthException catch (e) {
                              setState(() {
                                loading = false;
                                error = e.message.toString();
                              });
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(error),
                    ElevatedButton(
                        child: Text('No Account? Sign up!'),
                        onPressed: () {
                          widget.toggleView!();
                        }),
                  ],
                ),
              ),
            ),
          );
  }
}
