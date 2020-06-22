import 'package:flutter/material.dart';
import 'package:task/screens/current_task.dart';
import 'package:task/screens/settings.dart';
// import 'package:task/repository/services.dart';
// import 'package:task/widgets/loader.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';
  DashboardPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    CurrentTask(),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Settings"),
    ),
    Center(
      child: Text("Profile"),
    ),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // iconSize: 25,
        // backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            // backgroundColor: Colors.blue,
          ),
        ],
        onTap: onTappedBar,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
