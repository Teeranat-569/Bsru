

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'activityCal_model2Str.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // List<Widget> widgets = [];
  List<Widget> widgets4 = [];
  ActivityCalModel3 model3;
  @override
  void initState() {
    super.initState();
    readAlldata3();
  }

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      // ignore: await_only_futures
      await FirebaseFirestore.instance
          .collection('ActivityCal')
          .orderBy('DateTime')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          ActivityCalModel3 model3 = ActivityCalModel3.fromMap(map);
          setState(() {
            widgets4.add(createWidget3(model3));
          });
        }
      });
    });
  }

  Widget createWidget3(ActivityCalModel3 model3) => Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.purple[900],
              child: Text(
                '${model3.datetime}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.purple[50],
              child: Text(
                model3.eventname,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                ),
              )),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFffffff),
                const Color(0xFe3c0ab),
              ],
            ),
          ),
          child: widgets4.length == 0
              ? Center(child: CircularProgressIndicator())
              : 
              RefreshIndicator(onRefresh: readAlldata3,
                              child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 5,
      mainAxisSpacing: 0,
      crossAxisCount: 1,
      childAspectRatio: 16 / 4,
      children: 
        widgets4
      ,
      ),
              )
              // GridView.extent(
              //     maxCrossAxisExtent: 200,
              //     children: widgets4,
              //     padding: EdgeInsets.all(8),
              //     crossAxisSpacing: 4.0,
              //   )
                ),
    ));
  }
}
