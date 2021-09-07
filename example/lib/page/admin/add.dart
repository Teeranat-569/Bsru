import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/Calendar.dart';
import 'package:flutter_google_maps_example/page/admin/calendar_page.dart';

import '../../home.dart';
import 'upPic.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ผู้ดูแลระบบ',
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              MaterialPageRoute materialPageRoute =
                  MaterialPageRoute(builder: (BuildContext context) => Home());
              Navigator.of(context).pushAndRemoveUntil(
                  materialPageRoute, (Route<dynamic> route) => false);
            }),
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      route(Calendar_Admin());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'ปฏิทินกิจกรรม ปฏิทินวิชาการ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // ignore: deprecated_member_use
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      route(UpPic());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'แก้ไขรูปภาพข่าวรับสมัคร',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // ignore: deprecated_member_use
                  // RaisedButton(
                  //   padding: EdgeInsets.all(10),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(30.0),
                  //   ),
                  //   onPressed: () {
                  //     route(CalendarPageAc());
                  //   },
                  //   child: Text(
                  //     'ปฏิทินวิชาการ',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   // ignore: deprecated_member_use
              //   child: RaisedButton(
              //     padding: EdgeInsets.all(10),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     onPressed: () {
              //       route(Upload());
              //     },
              //     child: Text(
              //       'แก้ไขคู่มือนักศึกษา',
              //       style: TextStyle(fontSize: 26),
              //     ),
              //   ),
              // ),
            ],
          ),
        )),
      ),
    );
  }
}
