
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'form.dart';
import 'form2.dart';
import 'link_model.dart';

class ManualPage extends StatefulWidget {
  @override
  _ManualPageState createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
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
      ],
    );
  }

  RaisedButton
  
      // ignore: non_constant_identifier_names
      button1() {
    // ignore: deprecated_member_use
    return RaisedButton(
      
        onPressed: () {
          route(MyApp2());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'คู่มือเส้นทางสู่บัณฑิต 2560 - 2561',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)));
  }

  RaisedButton
      // ignore: non_constant_identifier_names
      button2() {
    // ignore: deprecated_member_use
    return RaisedButton( 
        onPressed: () {
          route(MyApp());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'คู่มือเส้นทางสู่บัณฑิต 2562 - 2563',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)));
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text('คู่มือนักศึกษา')),
        body: showGrid(),
      ),
    );
  }
}
