import 'package:flutter/material.dart';

class Day extends StatelessWidget {

  final String day;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
        child: Text(
            day
        ),
      ),
    );
  }

  const Day({Key key, @required this.day, @required this.height}) : super(key: key);

}