import 'package:flutter/material.dart';
import 'package:wastime/src/screens/today.dart';
import './components/navigation-wrapper.dart';
import './screens/three_days.dart';
import './screens/week.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wastime',
      initialRoute: '/',
      routes: {
        '/': (context) => NavigationWrapper(body: Today()),
        '/three-days': (context) => NavigationWrapper(body: ThreeDays()),
        '/week': (context) => NavigationWrapper(body: Week()),
      },
    );

    throw UnimplementedError();
  }
}
