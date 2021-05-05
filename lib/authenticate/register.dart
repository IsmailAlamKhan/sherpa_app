import 'package:flutter/material.dart';
import 'package:sherpa_app/services/auth.dart';
import 'package:sherpa_app/shared/loading.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
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
        title: Text('Sign up to sherpa it up'),
      ),*/
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
              child: Column(children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: new BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/SIcon.png")),
                  ),
                ),
                Container(
                  height: 30,
                  decoration: new BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/SHERPA.png")),
                  ),
                ),
                Container(
                  height: 20,
                  width: 300,
                ),
                Container(
                  height: 20,
                  width: 300,
                  child: Text("Register", textAlign: TextAlign.left),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 0.0),
                      TextFormField(
                        //USERNAME/EMAIL
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Color(0xffFEE2E2),
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffFEE2E2), width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffFEE2E2), width: 2.0),
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
                            borderSide: BorderSide(
                                color: Color(0xffFEE2E2), width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffFEE2E2), width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        obscureText: true,
                        validator: (val) =>
                            val!.length < 6 ? 'Enter password 6+ char' : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      /*------------------------------------------------REGISTRATION-----------------------------------------*/
                      ElevatedButton(
                          child: Text('Register'),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'please supply valid email';
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(error),
                      ElevatedButton(
                          child: Text('Already have an account'),
                          onPressed: () {
                            widget.toggleView!();
                          }),
                    ],
                  ),
                )
              ]),
            ),
          );
  }
}
