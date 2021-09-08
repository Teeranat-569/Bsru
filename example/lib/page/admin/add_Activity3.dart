import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/acadeCalspe_model2Str.dart';
import 'package:flutter_google_maps_example/page/admin/activityCal_model2Str.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'acadeCal_model2Str.dart';
import 'add.dart';

class Activity3 extends StatefulWidget {
  @override
  _Activity3State createState() => _Activity3State();
}

class _Activity3State extends State<Activity3> {
  final textFill = GlobalKey<FormState>();
  String nameForm;
  var textEditController = TextEditingController();
  String currentValued;
  var kk;
  CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('AcadeCalspecial');
  var collection = FirebaseFirestore.instance.collection('AcadeCalspecial');

  String time, link3;
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

    await firestore.collection('AcadeCal').doc().set(map).then((value) {
      print('insert Success*******');
    });
  }

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      // ignore: await_only_futures
      await FirebaseFirestore.instance
          .collection('AcadeCalspecial')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          AcadeCalspecial model2 = AcadeCalspecial.fromMap(map);

          setState(() {
            widgets2.add(model2);
            link3 = model2.link3;
            print(
                '//////////////////////////////////////////////////////$link3');
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
      children: [Text('Link ที่ถูกใช้ปัจจุบัน'), Text('$link3')],
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
                      '70Rd9GgMWEnWEC1V6O55') // <-- Doc ID where data should be updated.
                  .update({
                'link2': nameForm,
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
        title: Text('เพิ่มปฏิทินกิจกรรม'),
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
