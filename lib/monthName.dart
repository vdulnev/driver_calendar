import 'package:driver_calendar/utils.dart';
import 'package:flutter/material.dart';

class MonthName extends StatelessWidget {
  final int month;

  const MonthName({Key key, @required this.month}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(getMonthName(month));
  }

}