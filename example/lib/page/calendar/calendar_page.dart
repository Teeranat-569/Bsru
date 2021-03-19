import 'package:flutter/material.dart';

import 'add_acade.dart';
import 'add_event.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
           elevation: 0.0,
          backgroundColor: Colors.purple[50],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,color: Colors.purple,),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.purple,
          labelColor: Colors.pink,
            tabs: [
              Tab(
                text: 'ปฏิทินกิจกรรม',
              ),
              Tab(
                text: 'ปฏิทินวิชาการ',
              ),
            ],
          ),
          title: Text('ปฏิทิน', style: TextStyle(color: Colors.purple)),
        ),
        body: TabBarView(
          children: [CalendarPage(), CalendarPageAca()],
        ),
      ),
    );
  }
}
