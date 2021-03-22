import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'add.dart';

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  final textFill = GlobalKey<FormState>();
  String nameForm;
  var textEditController = TextEditingController();
  CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('AcadeCal');
  String timeStart;
  String timeEnd;
  var format = DateFormat.yMMMMEEEEd();

  Future<void> insertData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['Eventname'] = nameForm;
    map['DateTimeStart'] = timeStart;
    map['DateTimeEnd'] = timeEnd;

    setState(() {});

    await firestore.collection('ActivityCal').doc().set(map).then((value) {
      print('insert Success*******');
    });
  }

  void addUser() {
    _fireStore.add({
      'Eventname': nameForm,
      'DateTimeStart': timeStart,
      'DateTimeEnd': timeEnd,
    }).then((document) {
      // prints the document id when data adding succeed.
      debugPrint('+++++++++++++++++++++++++++++++++++' + document.id);
    });
  }

  Widget nameform() {
    return TextField(
      cursorHeight: 5.0,
        maxLines: 3,
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
          labelText: 'ระบุชื่องานวิชาการ',
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget timeStartForm() {
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
          labelText: 'วันที่เริ่ม',
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
        onChanged: (value) => timeStart = DateFormat.yMMMMEEEEd().format(value),
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

  Widget timeEndForm() {
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
          labelText: 'วันที่สิ้นสุด',
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
        onChanged: (value) => timeEnd = DateFormat.yMMMMEEEEd().format(value),
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
                msg: "เพิ่มปฏิทินสำเร็จ",
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
            tooltip: 'บันทึก',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('เพิ่มปฏิทินวิชาการ'),
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
                  height: 10.0,
                ),
                nameform(),
                SizedBox(
                  height: 10.0,
                ),
                timeStartForm(),
                SizedBox(
                  height: 10.0,
                ),
                timeEndForm(),
              ])),
        )),
      ),
    );
  }
}
