import 'package:flutter/material.dart';

class Day extends StatelessWidget {

  final String day;

  const Day({Key key, @required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.red))
        ),
        child: Text(
          day,
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }

}