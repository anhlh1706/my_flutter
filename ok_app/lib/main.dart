import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MaterialEx(),
  ));
}

class MaterialEx extends StatefulWidget {
  @override
  _MaterialExState createState() => _MaterialExState();
}

class _MaterialExState extends State<MaterialEx> {
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
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black87),
                    labelText: 'USERNAME',
                    alignLabelWithHint: true),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black87),
                      labelText: 'PASSWORD',
                      alignLabelWithHint: true),
                ),
              ),
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
                    onPressed: () => print('abc'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => print('Sign up'),
                    child: Text(
                      'NEW USER? SIGN UP',
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                  ),
                  TextButton(
                    onPressed: () => print('Fotgot password'),
                    child: Text('FORGOT PASSWORD?'),
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
}
