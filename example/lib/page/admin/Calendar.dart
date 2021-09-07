import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/calendar/fdf_calendar.dart';
import 'package:flutter_google_maps_example/page/calendar/fdf_calendar2.dart';
import 'package:flutter_google_maps_example/page/calendar/fdf_calendar3.dart';
import 'package:flutter_google_maps_example/page/manual/link_model.dart';

import 'fdf_calendar.dart';
import 'fdf_calendar2.dart';
import 'fdf_calendar3.dart';

class Calendar_Admin extends StatefulWidget {
  @override
  _Calendar_AdminState createState() => _Calendar_AdminState();
}

class _Calendar_AdminState extends State<Calendar_Admin> {
  String link;

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      await FirebaseFirestore.instance
          .collection('linkmanual')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          LinkModel model = LinkModel.fromMap(map);

          setState(() {
            link = model.link;
          });
        }
      });
    });
  }

  Widget showGrid() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      childAspectRatio: 16 / 3,
      children: <Widget>[
        button1(),
        button2(),
        button3(),
      ],
    );
  }

  // ignore: deprecated_member_use
  RaisedButton

      // ignore: non_constant_identifier_names
      button1() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(Calendar1_Admin());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'ปฏิทินวิชาการ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  RaisedButton
      // ignore: non_constant_identifier_names
      button2() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(Calendar2_Admin());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'กำหนดการลงทะเบียนเรียน ภาคปกติ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  RaisedButton
      // ignore: non_constant_identifier_names
      button3() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(Calendar3_Admin());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'กำหนดการลงทะเบียนเรียน ภาคพิเศษ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[50],
          toolbarHeight: 40,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
          ),
          title: Text(
            'คู่มือนักศึกษา',
            style: TextStyle(color: Colors.purple),
          )),
      body: Container(color: Colors.purple[50], child: showGrid()),
    );
  }
}
