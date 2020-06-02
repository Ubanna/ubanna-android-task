import 'package:flutter/material.dart';
// import 'package:task/models/task.dart';
import 'package:task/main.dart';
import 'package:task/repository/services.dart';

class UpdateTask extends StatefulWidget {
  UpdateTask({Key key, this.task}) : super(key: key);
  final Map task;

  @override
  _UpdateTask createState() => _UpdateTask();
}

class _UpdateTask extends State<UpdateTask> {
  var _taskTextInput = TextEditingController();
  var _vendorTextInput = TextEditingController();
  var _amountTextInput = TextEditingController();

  var id;
  var name;
  var amount;
  var vendor;
  var createdAt;
  var updatedAt;

  @override
  void initState() {
    super.initState();

    setState(() {
      id = this.widget.task['id'];
      name = this.widget.task['name'];
      amount = this.widget.task['amount'];
      vendor = this.widget.task['vendor'];
      print(this.widget.task);
    });
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
  Widget inputWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _taskTextInput,
        decoration: InputDecoration(hintText: "Eg, Business name limited..."),
      ),
    );
  }

  // init input widget
  Widget inputWidgetForVendor() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _vendorTextInput,
        decoration: InputDecoration(
            hintText: "Eg, Lifemate furnitures, Oros Computers, Mint and hams"),
      ),
    );
  }

  // init input widget
  Widget inputWidgetForAmount() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _amountTextInput,
        decoration: InputDecoration(hintText: "Eg, 1500"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final Task task = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Update Task'),
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
                child:
                    Text('Update Task', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  var res = await updateNewTask(_taskTextInput.text,
                      _vendorTextInput.text, _amountTextInput.text, id);
                  print(res);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
