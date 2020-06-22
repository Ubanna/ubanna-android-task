import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:task/main.dart';
import 'package:task/repository/services.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTask createState() => _AddTask();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, "Officemate"),
      Company(2, "MESL"),
      Company(3, "CIS"),
      Company(4, "Pensions"),
      Company(5, "Takara"),
    ];
  }
}

class _AddTask extends State<AddTask> {
  final format = DateFormat("yyyy-MM-dd");
  var _taskTextInput = TextEditingController();
  var _vendorTextInput = TextEditingController();
  var _amountTextInput = TextEditingController();

  // String _fileName;
  // String _path;
  // Map<String, String> _paths;
  // String _extension;
  // bool _loadingPath = false;
  // bool _multiPick = false;
  // bool _hasValidMime = false;
  // FileType _pickingType;
  // TextEditingController _controller = new TextEditingController();

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
    // _controller.addListener(() => _extension = _controller.text);
  }

  // void _openFileExplorer() async {
  //   if (_pickingType != FileType.CUSTOM || _hasValidMime) {
  //     setState(() => _loadingPath = true);
  //     try {
  //       if (_multiPick) {
  //         _path = null;
  //         _paths = await FilePicker.getMultiFilePath(
  //             type: _pickingType, fileExtension: _extension);
  //       } else {
  //         _paths = null;
  //         _path = await FilePicker.getFilePath(
  //             type: _pickingType, fileExtension: _extension);
  //       }
  //     } on PlatformException catch (e) {
  //       print("Unsupported operation" + e.toString());
  //     }
  //     if (!mounted) return;
  //     setState(() {
  //       _loadingPath = false;
  //       _fileName = _path != null
  //           ? _path.split('/').last
  //           : _paths != null ? _paths.keys.toString() : '...';
  //     });
  //   }
  // }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
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
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Todo Item",
            hintText: "Enter todo"),
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
            border: OutlineInputBorder(),
            labelText: "Description",
            hintText: "Eg, Give a short description"),
      ),
    );
  }

  // init input widget
  Widget inputWidgetForAmount() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _amountTextInput,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Cost",
            hintText: "Eg, 1500"),
      ),
    );
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Add Task'),
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            inputWidget(),
            Align(
              alignment: Alignment
                  .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
              child: Text(
                "Due Date",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DateTimeField(
              format: format,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                // filled: true,
                // fillColor: Theme.of(context).primaryColor,
                // prefixIcon: Icon(Icons.email),
                prefixIcon: Icon(Icons.calendar_today),
                hintText: "Due date",
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
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Select a project"),
                    SizedBox(
                      height: 20.0,
                    ),
                    DropdownButton(
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Assign to"),
                    SizedBox(
                      height: 20.0,
                    ),
                    DropdownButton(
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   child: Center(
            //       child: Column(
            //     children: <Widget>[
            //       new Padding(
            //         padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
            //         child: new RaisedButton(
            //           // onPressed: () => _openFileExplorer(),
            //           child: new Text("Open file picker"),
            //         ),
            //       ),
            //       new Builder(
            //         builder: (BuildContext context) => _loadingPath
            //             ? Padding(
            //                 padding: const EdgeInsets.only(bottom: 10.0),
            //                 child: const CircularProgressIndicator())
            //             : _path != null || _paths != null
            //                 ? new Container(
            //                     padding: const EdgeInsets.only(bottom: 30.0),
            //                     height:
            //                         MediaQuery.of(context).size.height * 0.50,
            //                     child: new Scrollbar(
            //                         child: new ListView.separated(
            //                       itemCount: _paths != null && _paths.isNotEmpty
            //                           ? _paths.length
            //                           : 1,
            //                       itemBuilder:
            //                           (BuildContext context, int index) {
            //                         final bool isMultiPath =
            //                             _paths != null && _paths.isNotEmpty;
            //                         final String name = 'File $index: ' +
            //                             (isMultiPath
            //                                 ? _paths.keys.toList()[index]
            //                                 : _fileName ?? '...');
            //                         final path = isMultiPath
            //                             ? _paths.values
            //                                 .toList()[index]
            //                                 .toString()
            //                             : _path;

            //                         return new ListTile(
            //                           title: new Text(
            //                             name,
            //                           ),
            //                           subtitle: new Text(path),
            //                         );
            //                       },
            //                       separatorBuilder:
            //                           (BuildContext context, int index) =>
            //                               new Divider(),
            //                     )),
            //                   )
            //                 : new Container(),
            //       ),
            //     ],
            //   )),
            // ),
            // inputWidgetForVendor(),
            // inputWidgetForAmount(),
            Container(
              margin: EdgeInsets.fromLTRB(45, 1, 45, 1),
              child: RaisedButton(
                color: Colors.indigo,
                child: Text('Add Item', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  var res = await addNewTask(_taskTextInput.text,
                      _vendorTextInput.text, _amountTextInput.text);
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
