import 'package:flutter/material.dart';
import 'package:task/screens/home.dart';
import 'package:task/screens/main_drawer.dart';
import 'package:task/screens/settings.dart';
import 'package:task/screens/taskreport.dart';

class CurrentTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: choices.length,
      child: Scaffold(
          appBar: AppBar(
              title: const Text('Task Management'),
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              bottom: TabBar(
                // isScrollable: true,
                tabs: choices.map<Widget>((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              )),
          // drawer: MainDrawer(),
          body: TabBarView(
            children: <Widget>[
              MyHomePage(),
              BasicDateField(),
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
  Choice(title: "FILTER", icon: Icons.sort),
  // Choice(title: "COMPLETED", icon: Icons.directions_walk)
];
