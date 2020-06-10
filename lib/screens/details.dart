import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  static const routeName = '/details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "This is the Profile Screen",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    )));
  }
}
