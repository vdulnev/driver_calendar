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
        YearMonthHeader(year: year, month: month),
        MonthDates(dates: dates)
      ],
    );
  }
}

class YearMonthHeader extends StatelessWidget {
  const YearMonthHeader({
    Key key,
    @required this.year,
    @required this.month,
  }) : super(key: key);

  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: YearName(year: year),
          ),
          MonthName(month: month)
        ],
      ),
    );
  }
}

class MonthDates extends StatelessWidget {
  final List<DateTime> dates;

  const MonthDates({Key key, this.dates}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxWidth/7.0;
        return Table(
          defaultColumnWidth: FractionColumnWidth(1.0/7.0),
          children: <TableRow>[
            buildTableHeader(height),
            buildTableRow(dates, 0, height),
            buildTableRow(dates, 1, height),
            buildTableRow(dates, 2, height),
            buildTableRow(dates, 3, height),
            buildTableRow(dates, 4, height),
            buildTableRow(dates, 5, height),
          ],
        );
      },
    );
  }

  TableRow buildTableHeader(double height) {
    return TableRow(
      children: <Widget>[
        Day(day: Intl.message('MON'), height: height),
        Day(day: Intl.message('TUE'), height: height),
        Day(day: Intl.message('WEB'), height: height),
        Day(day: Intl.message('THU'), height: height),
        Day(day: Intl.message('FRI'), height: height),
        Day(day: Intl.message('SAT'), height: height),
        Day(day: Intl.message('SUN'), height: height)
      ],
    );
  }

  TableRow buildTableRow(List<DateTime> dates, int week, double height) {
    return TableRow(
      children: <Widget>[
        Day(day: '${dates[week * 7]?.day ?? ""}', height: height),
        Day(day: '${dates[week * 7 + 1]?.day ?? ""}', height: height),
        Day(day: '${dates[week * 7 + 2]?.day ?? ""}', height: height),
        Day(day: '${dates[week * 7 + 3]?.day ?? ""}', height: height),
        Day(day: '${dates[week * 7 + 4]?.day ?? ""}', height: height),
        Day(day: '${dates[week * 7 + 5]?.day ?? ""}', height: height),
        Day(day: '${dates[week * 7 + 6]?.day ?? ""}', height: height),
      ],
    );
  }

}