import 'package:flutter/material.dart';
import 'package:task/repository/services.dart';
import 'package:task/widgets/loader.dart';

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
      home: MyHomePage(title: 'Task App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ListView _buildTaskList (task){
    return ListView.builder(
      itemCount: task.length,
      itemBuilder: (context, index){
        return _buildTaskWidget(task[index]);
      },
    );
  }

  // build the list widget
  Widget _buildTaskWidget(task) {
    return ListTile(
      leading: Icon(Icons.assignment),
      title: Text(task['name']),
      subtitle: Text(task['created_at']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: fetchAllTask(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              List task = snapshot.data;
              print(task);
              return  _buildTaskList(task);
            } else if(snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: ShowLoader(),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
