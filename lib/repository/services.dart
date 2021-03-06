import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:task/models/task.dart';

Future fetchAllTask() async {
  final response =
      await http.get('http://evening-sea-75226.herokuapp.com/api/currenttasks');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    List collections = json.decode(response.body);
    return collections;
//    return collections.map((model) => Task.fromJson(model)).toList();
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load notifications from API');
  }
}

Future addNewTask(String task, String vendor, String amount) async {
  final response = await http.post(
    'http://evening-sea-75226.herokuapp.com/api/task',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': task,
      'vendor': vendor,
      'amount': amount,
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 200 OK response, then parse the JSON.
    Map<String, dynamic> collections = json.decode(response.body);
    return collections;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load notifications from API');
  }
}

Future deleteTask(taskId) async {
  final response =
      await http.get('http://evening-sea-75226.herokuapp.com/api/task/$taskId');
  if (response.statusCode == 204) {
    // If the server did return a 200 OK response, then parse the JSON.
    // Map<String, dynamic> collections = json.decode(response.body);
    // return collections;
    print("Item deleted");
//    return collections.map((model) => Task.fromJson(model)).toList();
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load notifications from API');
  }
}

Future updateNewTask(String task, String vendor, String amount, taskId) async {
  final response = await http.put(
    'http://evening-sea-75226.herokuapp.com/api/updatetask/$taskId',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': task,
      'vendor': vendor,
      'amount': amount,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    Map<String, dynamic> collections = json.decode(response.body);
    return collections;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load notifications from API');
  }
}
