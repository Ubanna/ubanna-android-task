import 'package:flutter/material.dart';
import 'package:task/screens/home.dart';
import 'package:task/screens/main_drawer.dart';
import 'package:task/screens/settings.dart';

class CurrentTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: choices.length,
      child: Scaffold(
          appBar: AppBar(
              title: const Text('Task Management'),
              bottom: TabBar(
                // isScrollable: true,
                tabs: choices.map<Widget>((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              )),
          drawer: MainDrawer(),
          body: TabBarView(
            children: <Widget>[
              MyHomePage(),
              Settings(),
            ],
          )),
    ));
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: "TASK", icon: Icons.assignment),
  Choice(title: "PENDING", icon: Icons.access_time),
  // Choice(title: "COMPLETED", icon: Icons.directions_walk)
];
