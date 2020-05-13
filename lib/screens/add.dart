import 'package:flutter/material.dart';
import 'package:task/repository/services.dart';

class AddTask extends StatefulWidget {

  @override
  _AddTask createState() => _AddTask();
}

class _AddTask extends State<AddTask>{
  var _taskTextInput =  TextEditingController();
  var _vendorTextInput =  TextEditingController();
  var _amountTextInput =  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // dispose after use
  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    _taskTextInput.dispose();
    _vendorTextInput.dispose();
    _amountTextInput.dispose();
    super.dispose();
  }

  // init input widget
  Widget inputWidget(){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _taskTextInput,
        decoration: InputDecoration(
          hintText: "Eg, wake up by 2pm, Go to store..."
        ),
      ),
    );
  }

  // init input widget
  Widget inputWidgetForVendor(){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _vendorTextInput,
        decoration: InputDecoration(
            hintText: "Eg, Lifemate furnitures, Oros Computers, Mint and hams"
        ),
      ),
    );
  }

  // init input widget
  Widget inputWidgetForAmount(){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _amountTextInput,
        decoration: InputDecoration(
            hintText: "Eg, 1500"
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: ListView(
        children: <Widget>[
          inputWidget(),
          inputWidgetForVendor(),
          inputWidgetForAmount(),
          Container(
            margin: EdgeInsets.fromLTRB(45, 1, 45, 1),
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text('Add Task', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                 var res = await addNewTask(_taskTextInput.text, _vendorTextInput.text,  _amountTextInput.text);
                 print(res);
              },
            ),
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}