import 'package:driver_calendar/month.dart';
import 'package:driver_calendar/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
  final pageController = PageController(initialPage: 1);
  double page = 1.0;
  double delta = 0.001;


  @override
  void initState() {
    super.initState();
    pageController.addListener(_onNextPage);
  }

  void _nextMonth() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _dateTime = addMonth(_dateTime);
    });
  }

  void _prevMonth() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _dateTime = subtractMonth(_dateTime);
    });
  }

  void _onNextPage() {
    var currentPage = pageController.page;
    print("currentPage: " + pageController.page.toString());
    print("page: " + page.toString());
    var currentDelta = (page - currentPage).abs();
    print("delta: " + currentDelta.toString());
    if (currentDelta < delta || 1 - currentDelta < delta) {
      page = currentPage.roundToDouble();
      print("new page: " + page.toString());
      switch(currentPage.round()) {
        case 0: {_prevMonth();
        pageController.jumpToPage(1);
        break;
        }
        case 2: {_nextMonth(); pageController.jumpToPage(1); break;}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final prevDate = subtractMonth(_dateTime);
    final nextDate = addMonth(_dateTime);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Card(
          child: PageView(
            controller: pageController,
            children: <Widget>[
              Month(year: prevDate.year, month: prevDate.month),
              Month(year: _dateTime.year, month: _dateTime.month),
              Month(year: nextDate.year, month: nextDate.month)
            ],
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextMonth,
        tooltip: 'Increment',
        child: Icon(Icons.message),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
