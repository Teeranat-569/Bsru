import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

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
  String time;

  int index;

  Future<void> insertData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['Eventname'] = nameForm;
    map['DateTime'] = time;

    setState(() {});

    await firestore.collection('ActivityCal').doc().set(map).then((value) {
      print('insert Success*******');
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
          labelText: 'ระบุกิจกรรม',
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ));
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
          labelStyle: TextStyle(fontSize: 16.0.sp, color: Colors.black),
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
              addUser();
              route(Add());
              Fluttertoast.showToast(
                msg: "เพิ่มกิจกรรมสำเร็จ",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.purple[100],
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
                SizedBox(
                  height: 10.0.h,
                ),
                nameform(),
                SizedBox(
                  height: 10.0.h,
                ),
                timeForm(),
                SizedBox(
                  height: 15.0.h,
                ),
              ])),
        )),
      ),
    );
  }
}
