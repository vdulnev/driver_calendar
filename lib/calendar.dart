import 'package:driver_calendar/utils.dart';
import 'package:flutter/material.dart';

import 'month.dart';

class Calendar extends StatefulWidget {
  final DateTime currentDate;

  const Calendar({Key key , DateTime date, this.currentDate}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CalendarState(currentDate);
  }
}

class CalendarState extends State<Calendar> {

  DateTime selectedDate;
  DateTime currentDate;
  final pageController = PageController(initialPage: 1);
  double page = 1.0;
  double delta = 0.001;

  CalendarState(this.currentDate) {
    pageController.addListener(_onNextPage);
  }

  @override
  Widget build(BuildContext context) {
    final prevDate = subtractMonth(currentDate);
    final nextDate = addMonth(currentDate);
    return PageView(
        controller: pageController,
        children: <Widget>[
          Month(year: prevDate.year, month: prevDate.month),
          Month(year: currentDate.year, month: currentDate.month),
          Month(year: nextDate.year, month: nextDate.month)
        ]
    );
  }

  void nextMonth() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      currentDate = addMonth(currentDate);
    });
  }

  void _prevMonth() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      currentDate = subtractMonth(currentDate);
    });
  }

  void _onNextPage() {
    final currentPage = pageController.page;
    final currentDelta = (page - currentPage).abs();
    if (currentDelta < delta || 1 - currentDelta < delta) {
      page = currentPage.roundToDouble();
      switch (currentPage.round()) {
        case 0:
          {
            _prevMonth();
            pageController.jumpToPage(1);
            break;
          }
        case 2:
          {
            nextMonth();
            pageController.jumpToPage(1);
            break;
          }
      }
    }
  }

}