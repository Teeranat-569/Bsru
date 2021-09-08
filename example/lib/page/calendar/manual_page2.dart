import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/calendar/fdf_calendar%20copy.dart';
import 'package:flutter_google_maps_example/page/calendar/fdf_calendar2%20copy.dart';
import 'package:flutter_google_maps_example/page/calendar/fdf_calendar3%20copy.dart';

import 'package:flutter_google_maps_example/page/manual/link_model.dart';

class ManualPage2 extends StatefulWidget {
  @override
  _ManualPage2State createState() => _ManualPage2State();
}

class _ManualPage2State extends State<ManualPage2> {
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
          route(Calendar1());
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
          route(Calendar2());
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
          route(Calendar3());
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
