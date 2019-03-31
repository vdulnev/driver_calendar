import 'package:driver_calendar/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US')
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateTime = new DateTime.now();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      int _year = _dateTime.year;
      int _month = _dateTime.month;
      if (_dateTime.month == DateTime.december) {
        _month = DateTime.january;
        _year++;
      } else {
        _month++;
      }
      _dateTime = new DateTime(_year, _month);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    List<DateTime> dates = getDates();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemExtent: 20.0,
          itemBuilder: (BuildContext context, int index) {
            return Text('entry $index');
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Table buildCalendar(List<DateTime> dates) {
    return Table(
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
              Day(day: '${dates[week * 7].day}'),
              Day(day: '${dates[week * 7 + 1].day}'),
              Day(day: '${dates[week * 7 + 2].day}'),
              Day(day: '${dates[week * 7 + 3].day}'),
              Day(day: '${dates[week * 7 + 4].day}'),
              Day(day: '${dates[week * 7 + 5].day}'),
              Day(day: '${dates[week * 7 + 6].day}'),
            ],
          );
  }

  List<DateTime> getDates() {
    DateTime start = DateTime(_dateTime.year, _dateTime.month);
    int dayOfWeek = start.weekday;
    if (dayOfWeek > DateTime.monday) {
      start = start.subtract(Duration(days: dayOfWeek - DateTime.monday));
    }
    List<DateTime> dates = List();
    dates.add(DateTime(start.year, start.month, start.day));
    while (dates.length < 42) {
      start = start.add(Duration(days: 1));
      dates.add(DateTime(start.year, start.month, start.day));
    }
    return dates;
  }

  bool isMonthLess(DateTime start, DateTime finish) {
    if (start.year > finish.year) return false;
    return finish.month > start.month;
  }
}
