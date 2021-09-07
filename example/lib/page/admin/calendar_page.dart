
import 'package:flutter/material.dart';

import 'add_Academic.dart';
import 'add_Activity.dart';
import 'add_acade.dart';
import 'add_eventAd.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            leading: IconButton(
              onPressed: () {
                // MaterialPageRoute materialPageRoute = MaterialPageRoute(
                //     builder: (BuildContext context) => Home());
                // Navigator.of(context).pushAndRemoveUntil(
                //     materialPageRoute, (Route<dynamic> route) => false);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ปฏิทินกิจกรรม'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        child: RaisedButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            route(Activity());
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          // Text(
                          //   'ปฏิทินกิจกรรม',
                          //   style:
                          //       TextStyle(fontSize: 11, color: Colors.white),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ปฏิทินวิชาการ'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        child: RaisedButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            route(Academic());
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          // Text(
                          //   'ปฏิทินวิชาการ',
                          //   style: TextStyle(fontSize: 11, color: Colors.white),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            title: Text(
              'ผู้ดูแลระบบ',
              style: TextStyle(fontSize: 14),
            ),
          ),
          body: TabBarView(
            children: [CalendarPage(), CalendarPageAc()],
          ),
        ),
      ),
    );
  }
}
