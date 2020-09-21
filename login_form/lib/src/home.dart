import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _getFloatingActionButton(),
        appBar: AppBar(title: Text('Home')),
        bottomNavigationBar: _getBottomNavigationBar());
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            title: Text('1st'), icon: Icon(Icons.account_circle)),
        BottomNavigationBarItem(title: Text('2nd'), icon: Icon(Icons.list)),
        BottomNavigationBarItem(title: Text('3rd'), icon: Icon(Icons.menu))
      ],
      onTap: (int index) => print(index),
    );
  }

  FloatingActionButton _getFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => print('Tap floating'),
      backgroundColor: Colors.amber,
      child: Icon(Icons.phone),
    );
  }
}
