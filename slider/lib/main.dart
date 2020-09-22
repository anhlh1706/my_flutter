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
  Color _primaryColor = Color.fromRGBO(116, 47, 206, 1);
  Color _secondaryColor = Color.fromRGBO(244, 237, 254, 1);
  double _billValue = 0;
  int _numberOfPeople = 1;
  double _priceFerPerson = 0;
  double _tipPercent = 0;
  double _tipValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              children: [
                _totalView(),
                _calculateView(),
              ],
            )));
  }

  Container _totalView() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: _secondaryColor),
      margin: EdgeInsets.only(left: 30, right: 30, top: 90),
      width: double.infinity,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total per person',
            style: TextStyle(
                fontSize: 15,
                color: _primaryColor,
                fontWeight: FontWeight.w600),
          ),
          Text('\$$_priceFerPerson',
              style: TextStyle(
                  fontSize: 30,
                  color: _primaryColor,
                  fontWeight: FontWeight.w800))
        ],
      ),
    );
  }

  Container _calculateView() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Bill Amount  ',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixText: '\$',
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        _billValue = double.parse(value);
                      });
                      updateAvegare();
                      updateTipValue();
                    },
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.2,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Split',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: _secondaryColor),
                          width: 30,
                          height: 30,
                          child: Center(
                            child: Text('-',
                                style: TextStyle(
                                    color: _primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                          ),
                        ),
                        onTap: () {
                          if (_numberOfPeople == 1) {
                            return;
                          }
                          setState(() {
                            _numberOfPeople -= 1;
                          });
                          updateAvegare();
                        },
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                            '$_numberOfPeople',
                            style: TextStyle(
                                color: _primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: _secondaryColor),
                          width: 30,
                          height: 30,
                          child: Center(
                            child: Text('+',
                                style: TextStyle(
                                    color: _primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _numberOfPeople += 1;
                          });
                          updateAvegare();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tip',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text('\$$_tipValue',
                        style: TextStyle(
                            color: _primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('$_tipPercent%',
                  style: TextStyle(
                      color: _primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ),
            Slider(
              min: 0,
              max: 50,
              divisions: 10,
              inactiveColor: _secondaryColor,
              activeColor: _primaryColor,
              value: _tipPercent,
              onChanged: (value) {
                setState(() {
                  _tipPercent = value;
                });
                updateAvegare();
                updateTipValue();
              },
            )
          ],
        ),
      ),
    );
  }

  void updateTipValue() {
    setState(() {
      _tipValue = _tipPercent * _billValue / 100;
    });
  }

  void updateAvegare() {
    setState(() {
      _priceFerPerson = (_billValue + _tipValue) / _numberOfPeople;
    });
  }
}
