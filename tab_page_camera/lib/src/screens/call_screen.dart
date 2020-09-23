import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  var dataSource =
      'Updates were rejected because the remote contains work that you do not have locally.'
          .split(' ');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white70,
          height: 200,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dataSource.length,
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
              child: Text('.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n'),
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 120,
                height: 200,
                child: Image(
                  image: NetworkImage(
                      'http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb'),
                ),
              );
            },
          ),
        ),
        Spacer()
      ],
    );
  }
}
