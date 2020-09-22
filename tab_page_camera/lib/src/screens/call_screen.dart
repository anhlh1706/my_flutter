import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  var dataSource =
      'Updates were rejected because the remote contains work that you do not have locally.'
          .split(' ');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataSource.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(dataSource[index]),
            ),
          );
        });
  }
}
