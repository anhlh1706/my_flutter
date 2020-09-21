import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _primaryColor = Colors.pinkAccent;
  double _priceFerPerson = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [_totalView(), _calculateView()],
        ));
  }

  Container _totalView() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.lightGreen),
      margin: EdgeInsets.only(left: 30, right: 30, top: 90),
      width: double.infinity,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total per person',
            style: TextStyle(fontSize: 15, color: _primaryColor),
          ),
          Text('\$$_priceFerPerson',
              style: TextStyle(fontSize: 30, color: _primaryColor))
        ],
      ),
    );
  }

  Container _calculateView() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
