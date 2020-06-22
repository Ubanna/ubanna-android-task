import 'package:flutter/material.dart';
import 'package:task/screens/details.dart';
import 'package:task/screens/getting_started_screen.dart';
import 'package:task/screens/login_screen.dart';
import 'package:task/screens/settings.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.indigo,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/3189023/pexels-photo-3189023.jpeg?auto=compress&cs=tinysrgb&h=650&w=940'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Ubanna Dan-Ekeh',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'ubanna.dan-ekeh@cavidel.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Details()));
              // Navigator.of(context).pushNamed(Details.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => GettingStartedScreen()));
              //  Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => GettingStartedScreen()));
            },
          ),
        ],
      ),
    );
  }
}
