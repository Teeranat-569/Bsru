
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
    return SafeArea(
      child: DefaultTabController(
        length: 2,
              child: Scaffold(
          appBar: AppBar(toolbarHeight: 80,
         
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          },icon: Icon(Icons.arrow_back_ios),),
            bottom: TabBar(
              tabs: [
                Tab(text: 'ปฏิทินกิจกรรม',),
                Tab(text: 'ปฏิทินวิชาการ',),
              ],
            ),
             title: Text('ปฏิทิน'),
          ),
          body: TabBarView(
              children: [
                CalendarPage(),
                CalendarPageAca()
              ],
            ),
        ),
      ),
    );
  }
}
