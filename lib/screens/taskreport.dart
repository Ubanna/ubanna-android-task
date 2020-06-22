import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

// ...

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment
                .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
            child: Text(
              "FROM:",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          DateTimeField(
            format: format,
            style: TextStyle(fontSize: 18, color: Colors.black54),
            decoration: InputDecoration(
              filled: true,
              // fillColor: Theme.of(context).primaryColor,
              // prefixIcon: Icon(Icons.email),
              prefixIcon: Icon(Icons.calendar_today),
              hintText: "Start date",
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
          Align(
            alignment: Alignment
                .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
            child: Text(
              "TO:",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          DateTimeField(
            format: format,
            style: TextStyle(fontSize: 18, color: Colors.black54),
            decoration: InputDecoration(
              filled: true,
              // fillColor: Theme.of(context).primaryColor,
              // prefixIcon: Icon(Icons.email),
              prefixIcon: Icon(Icons.calendar_today),
              hintText: "End date",
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
            margin: EdgeInsets.fromLTRB(45, 1, 45, 1),
            child: RaisedButton(
              color: Colors.indigo,
              child: Text('Show Tasks', style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
          )
        ]);
  }
}

// class BasicTimeField extends StatelessWidget {
//   final format = DateFormat("HH:mm");
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Basic time field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final time = await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//           );
//           return DateTimeField.convert(time);
//         },
//       ),
//     ]);
//   }
// }

// class BasicDateTimeField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Basic date & time field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final date = await showDatePicker(
//               context: context,
//               firstDate: DateTime(1900),
//               initialDate: currentValue ?? DateTime.now(),
//               lastDate: DateTime(2100));
//           if (date != null) {
//             final time = await showTimePicker(
//               context: context,
//               initialTime:
//                   TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//             );
//             return DateTimeField.combine(date, time);
//           } else {
//             return currentValue;
//           }
//         },
//       ),
//     ]);
//   }
// }
