import 'package:flutter/material.dart';
import 'package:task/screens/dashboard.dart';
import 'package:task/screens/details.dart';
// import 'package:task/screens/home.dart';
import 'package:task/screens/getting_started_screen.dart';
import 'package:task/screens/password_reset.dart';
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
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: GettingStartedScreen(),
      // routes: {
      //   DashboardPage.routeName: (ctx) => DashboardPage(),
      //   LoginScreen.routeName: (ctx) => LoginScreen(),
      //   // MyHomePage.routeName: (ctx) => MyHomePage(title: 'Task App'),
      //   PasswordReset.routeName: (ctx) => PasswordReset(),
      //   Details.routeName: (ctx) => Details(),
      //   Settings.routeName: (ctx) => Settings(),
      // }
      // MyHomePage(title: 'Task App'),
    );
  }
}
