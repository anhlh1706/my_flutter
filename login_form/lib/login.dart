import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isSercure = true;

  var usernameIsValid = false;
  var passwordIsValid = false;

  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/cat.png'),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Hello\nWelcome Back",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                controller: emailTEC,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black87),
                    labelText: 'EMAIL',
                    errorText: usernameIsValid ? null : 'Invalid email',
                    alignLabelWithHint: true),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        controller: passwordTEC,
                        obscureText: isSercure,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black87),
                            labelText: 'PASSWORD',
                            errorText: passwordIsValid
                                ? null
                                : 'Password must be more than 6 chars',
                            alignLabelWithHint: true),
                      ),
                      GestureDetector(
                        onTap: onToggleShowpass,
                        child: Text(isSercure ? "SHOW" : "HIDE",
                            style:
                                TextStyle(color: Colors.green, fontSize: 13)),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: onSignInTap,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () => print('Sign up'),
                    child: Text(
                      'NEW USER? SIGN UP',
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => print('Fotgot password'),
                    child: Text('FORGOT PASSWORD?',
                        style: TextStyle(color: Colors.green)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      title: "OKE",
    );
  }

  void onToggleShowpass() {
    setState(() {
      isSercure = !isSercure;
    });
  }

  void onSignInTap() {
    setState(() {
      usernameIsValid = emailTEC.text.contains('@');
      passwordIsValid = passwordTEC.text.length >= 6;
    });
    if (usernameIsValid && passwordIsValid) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
