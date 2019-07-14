
import 'package:intl/intl.dart';

String getMonthName(int month) {
  switch(month) {
    case 1: return Intl.message("January");
    case 2: return Intl.message("Februaury");
    case 3: return Intl.message("March");
    case 4: return Intl.message("April");
    case 5: return Intl.message("May");
    case 6: return Intl.message("June");
    case 7: return Intl.message("July");
    case 8: return Intl.message("August");
    case 9: return Intl.message("September");
    case 10: return Intl.message("October");
    case 11: return Intl.message("November");
    case 12: return Intl.message("December");
  }
  return "Uknown: " + month.toString();
}

List<DateTime> getDates(int year, int month) {
  DateTime start = DateTime(year, month);
  int dayOfWeek = start.weekday;
  if (dayOfWeek > DateTime.monday) {
    start = start.subtract(Duration(days: dayOfWeek - DateTime.monday));
  }
  List<DateTime> dates = List();
  if (start.year == year && start.month == month) {
    dates.add(DateTime(start.year, start.month, start.day));
  } else {
    dates.add(null);
  }
  while (dates.length < 42) {
    start = start.add(Duration(days: 1));
    if (start.year == year && start.month == month) {
      dates.add(DateTime(start.year, start.month, start.day));
    } else {
      dates.add(null);
    }
  }
  return dates;
}

DateTime addMonth(DateTime date) {
  int _year = date.year;
  int _month = date.month;
  if (_month == DateTime.december) {
    _month = DateTime.january;
    _year++;
  } else {
    _month++;
  }
  return new DateTime(_year, _month);
}

DateTime subtractMonth(DateTime date) {
  int _year = date.year;
  int _month = date.month;
  if (_month == DateTime.january) {
    _month = DateTime.december;
    _year--;
  } else {
    _month--;
  }
  return new DateTime(_year, _month);
}