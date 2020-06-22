import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/screens/griddashboard.dart';
import 'package:task/screens/main_drawer.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xff392850),
        backgroundColor: Colors.white,
        appBar: AppBar(
          // title: const Text('Dashboard'),
          // backgroundColor: Color(0xff392850),
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 110,
            // ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Hi, Ubanna",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Dashboard",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Image.asset(
                      "assets/images/notification.png",
                      width: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GridDashboard(),
          ],
        ));
  }
}
