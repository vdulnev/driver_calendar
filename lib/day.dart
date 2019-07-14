import 'package:flutter/material.dart';

class Day extends StatelessWidget {

  final String day;

  @override
  Widget build(BuildContext context) {
    return Text(
      day
    );
  }

  const Day({Key key, @required this.day}) : super(key: key);

}