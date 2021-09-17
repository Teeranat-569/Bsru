import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/activityCal_model2Str.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'add.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  final textFill = GlobalKey<FormState>();
  String nameForm;
  var textEditController = TextEditingController();
  String currentValued;
  var kk;
  CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('ActivityCal');
  var collection = FirebaseFirestore.instance.collection('ActivityCal');

  String time, link1;
  List<dynamic> widgets2 = [];

  int index;
  @override
  void initState() {
    super.initState();
    readAlldata3();
  }

  Future<void> insertData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['Eventname'] = nameForm;
    map['DateTime'] = time;

    setState(() {
      // readAlldata3();
    });

    await firestore.collection('ActivityCal').doc().set(map).then((value) {
      print('insert Success*******');
    });
  }

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      // ignore: await_only_futures
      await FirebaseFirestore.instance
          .collection('ActivityCal')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          ActivityModel model2 = ActivityModel.fromMap(map);

          setState(() {
            widgets2.add(model2);
            link1 = model2.link1;
            print(
                '//////////////////////////////////////////////////////$link1');
          });
        }
      });
    });
  }

  void addUser() {
    _fireStore.add({
      'Eventname': nameForm,
      'DateTime': time,
      // 'indexid' : index,
    }).then((document) {
      // prints the document id when data adding succeed.
      debugPrint('+++++++++++++++++++++++++++++++++++' + document.id);
    });
  }

  Widget nameform() {
    return TextField(
        onChanged: (value) => nameForm = value.trim(),
        controller: textEditController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'ระบุ link ปฏิทินวิชาการ',
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget link() {
    return Column(
      children: [
        Text('Link ที่ถูกใช้ปัจจุบัน'),
        Text(
          '$link1',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  var format = DateFormat.yMMMMEEEEd();

  Widget timeForm() {
    return Column(children: <Widget>[
      DateTimeField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'วันที่ทำกิจกรรม',
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
        onChanged: (value) => time = DateFormat.yMMMMEEEEd().format(value),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // insertData();
              // addUser();
              collection
                  .doc(
                      '15bfjhVepH732Wn0Jesn') // <-- Doc ID where data should be updated.
                  .update({
                'link1': nameForm,
              });
              // route(Add());
              Fluttertoast.showToast(
                msg: "แก้ไขสำเร็จ",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.orange[100],
                textColor: Colors.black,
              );
            },
            child: Icon(
              Icons.save,
              size: 40.0,
            ),
            backgroundColor: Colors.pink,
            tooltip: 'บันทึกกิจกรรม',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('แก้ไขปฏิทินวิชาการ'),
        toolbarHeight: 40,
      ),
      body: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
              key: textFill,
              child: ListView(children: <Widget>[
                link(),
                SizedBox(
                  height: 10.0,
                ),
                nameform(),
                SizedBox(
                  height: 10.0,
                ),
                // timeForm(),
                // SizedBox(
                //   height: 15.0,
                // ),
              ])),
        )),
      ),
    );
  }
}
