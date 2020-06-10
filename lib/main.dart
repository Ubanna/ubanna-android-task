import 'package:flutter/material.dart';
import 'package:task/screens/dashboard.dart';
import 'package:task/screens/details.dart';
// import 'package:task/screens/home.dart';
import 'package:task/screens/getting_started_screen.dart';
import 'package:task/screens/settings.dart';
import './screens//login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: GettingStartedScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          // MyHomePage.routeName: (ctx) => MyHomePage(title: 'Task App'),
          DashboardPage.routeName: (ctx) => DashboardPage(),
          Details.routeName: (ctx) => Details(),
          Settings.routeName: (ctx) => Settings(),
          GettingStartedScreen.routeName: (ctx) => GettingStartedScreen(),
        }
        // MyHomePage(title: 'Task App'),
        );
  }
}
