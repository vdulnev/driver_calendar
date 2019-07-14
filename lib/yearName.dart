import 'package:flutter/material.dart';

class YearName extends StatelessWidget {
  final int year;

  const YearName({Key key, @required this.year}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(year.toString());
  }

}