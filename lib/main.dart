import 'package:flutter/material.dart';
import 'package:task/repository/services.dart';
import 'package:task/widgets/loader.dart';
import 'package:task/screens/add.dart';
import 'package:task/screens/update.dart';

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
  var listItems;

  @override
  void initState() {
    super.initState();
    listItems = fetchAllTask();
  }

  Future<void> undoDeletion(index, item) {
    setState(() {
      listItems.insert(index, item);
    });
  }

  ListView _buildTaskList(tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
//          key: ObjectKey(tasks[index]),
          // key: UniqueKey(),
          key: Key(UniqueKey().toString()),
          // key: Key(tasks[index]),
          child: Container(
            child: _buildTaskWidget(tasks[index]),
          ),
          onDismissed: (direction) {
            //To delete
            deleteTask(tasks[index]['id']);

            var item = listItems.elementAt(index);

            //To show a snackbar with the UNDO button
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Item deleted"),
                action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      //To undo deletion
                      undoDeletion(index, item);
                    })));
          },
        );
      },
    );
  }

  // build the list widget
  Widget _buildTaskWidget(task) {
    return ListTile(
        leading: Icon(Icons.assignment),
        title: Text(task['name']),
        subtitle: Text(task['created_at']),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UpdateTask(task: task),
            ),
          );
          setState(() {
            listItems = fetchAllTask();
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: listItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List tasks = snapshot.data;
              listItems = tasks;

              return _buildTaskList(tasks);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: ShowLoader(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTask()));
          setState(() {
            listItems = fetchAllTask();
          });
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
