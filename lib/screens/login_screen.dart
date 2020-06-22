import 'package:flutter/material.dart';
import 'package:task/screens/dashboard.dart';
import 'package:task/screens/main_dashboard.dart';
import 'package:task/screens/password_reset.dart';
// import 'package:task/screens/home.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text('Login'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: Theme.of(context).primaryColor,
                  // prefixIcon: Icon(Icons.email),
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: Theme.of(context).primaryColor,
                  // Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainDashboard()));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PasswordReset()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
