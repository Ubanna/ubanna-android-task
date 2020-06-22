import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/screens/current_task.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Calender",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "assets/images/calender.png");

  Items item2 = new Items(
      title: "Task",
      subtitle: "UI/UX, Database design",
      event: "4 Items",
      img: "assets/images/todo.png");

  Items item3 = new Items(
      title: "Location",
      subtitle: "Tobi going to office",
      event: "",
      img: "assets/images/map.png");

  Items item4 = new Items(
      title: "Activity",
      subtitle: "Rose tested your App",
      event: "",
      img: "assets/images/festival.png");

  Items item5 = new Items(
      title: "Meetings",
      subtitle: "8am Meeting at Eko Hotel, V/I",
      event: "4 Items",
      img: "assets/images/meet.png");

  Items item6 = new Items(
      title: "Settings",
      subtitle: "",
      event: "2 Items",
      img: "assets/images/settings.png");

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    // var color = 0xff453658;
    var color = 0xff7986cb;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CurrentTask()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          data.img,
                          width: 42,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          data.title,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          data.subtitle,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          data.event,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )));
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
