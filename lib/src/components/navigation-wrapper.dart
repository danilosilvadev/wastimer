import 'package:flutter/material.dart';

class NavigationWrapper extends StatefulWidget {
  final Widget body;

  NavigationWrapper({this.body});
  createState() {
    return NavigationWrapperState(body: body);
  }
}

class NavigationWrapperState extends State<NavigationWrapper> {
  var _indexPage = 0;
  final Widget body;

  NavigationWrapperState({this.body});

  void selectRoute() {
    switch (_indexPage) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/three-days');
        break;
      case 2:
        Navigator.pushNamed(context, '/week');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body,
        appBar: AppBar(
          title: Text('Wastimer'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexPage,
          onTap: (int index) {
            setState(() {
              _indexPage = index;
            });
            selectRoute();
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.linear_scale),
              label: '3 days',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Week',
            )
          ],
        ));
  }
}
