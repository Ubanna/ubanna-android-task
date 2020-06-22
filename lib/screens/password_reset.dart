import 'package:flutter/material.dart';
import 'package:task/screens/login_screen.dart';

class PasswordReset extends StatelessWidget {
  static const routeName = '/passwordreset';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).primaryColor,
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
                height: 30,
              ),
              Text(
                "Reset your password.",
                style: TextStyle(
                  fontSize: 35,
                ),
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
              FlatButton(
                child: Text(
                  "Submit",
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
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
