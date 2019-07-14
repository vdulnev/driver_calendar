import 'package:driver_calendar/day.dart';
import 'package:driver_calendar/monthName.dart';
import 'package:driver_calendar/utils.dart';
import 'package:driver_calendar/yearName.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Month extends StatelessWidget {
  final int year;
  final int month;

  const Month({Key key, @required this.year, @required this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = getDates(year, month);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YearName(year: year),
            MonthName(month: month)
          ],
        ),
        MonthDates(dates: dates)
      ],
    );
  }
}

class MonthDates extends StatelessWidget {
  final List<DateTime> dates;

  const MonthDates({Key key, this.dates}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      children: <TableRow>[
        buildTableHeader(),
        buildTableRow(dates, 0),
        buildTableRow(dates, 1),
        buildTableRow(dates, 2),
        buildTableRow(dates, 3),
        buildTableRow(dates, 4),
        buildTableRow(dates, 5),
      ],
    );
  }

  TableRow buildTableHeader() {
    return TableRow(
      children: <Widget>[
        Day(day: Intl.message('MON')),
        Day(day: Intl.message('TUE')),
        Day(day: Intl.message('WEB')),
        Day(day: Intl.message('THU')),
        Day(day: Intl.message('FRI')),
        Day(day: Intl.message('SAT')),
        Day(day: Intl.message('SUN'))
      ],
    );
  }

  TableRow buildTableRow(List<DateTime> dates, int week) {
    return TableRow(
      // Column is also layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      children: <Widget>[
        Day(day: '${dates[week * 7]?.day ?? ""}'),
        Day(day: '${dates[week * 7 + 1]?.day ?? ""}'),
        Day(day: '${dates[week * 7 + 2]?.day ?? ""}'),
        Day(day: '${dates[week * 7 + 3]?.day ?? ""}'),
        Day(day: '${dates[week * 7 + 4]?.day ?? ""}'),
        Day(day: '${dates[week * 7 + 5]?.day ?? ""}'),
        Day(day: '${dates[week * 7 + 6]?.day ?? ""}'),
      ],
    );
  }

}