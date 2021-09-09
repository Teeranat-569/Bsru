import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/fdf_manualAdmin.dart';
import 'package:flutter_google_maps_example/page/manual/link_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'add.dart';

class AddManual extends StatefulWidget {
  @override
  _AddManualState createState() => _AddManualState();
}

class _AddManualState extends State<AddManual> {
  final textFill = GlobalKey<FormState>();
  String nameForm, link, nameManual, nameManualForm;
  var textEditController = TextEditingController();
  var textEditController4 = TextEditingController();
  CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('AcadeCal');
  String timeStart;
  String timeEnd;
  var format = DateFormat.yMMMMEEEEd();
  List<dynamic> widgets = [];

  @override
  void initState() {
    super.initState();
    // readAlldata3();
    readAllData();
  }

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
            widgets.add(model);
            link = model.link;
            nameManual = model.nameManual;
          });
        }
      });
    });
  }

  Widget showListdata() {
    return RefreshIndicator(
      onRefresh: readAlldata3,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 12),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.shade200,
              ),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                  onPressed: () {
                    // route(Fdf_manual_admin(), widgets[index]);
                  },
                  padding: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widgets[index]["nameManual"]}',
                          style: TextStyle(fontSize: 14),
                        ),
                        FlatButton(
                          onPressed: () {
                            myAlert(widgets[index]["docid"]);
                            print(
                                '----------------------------------${widgets[index]["docid"]}');
                          },
                          // color: Colors.grey[350],
                          child: Center(
                              child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
          );
        },
      ),
    );
  }

  void myAlert(String docid) {
    showDialog(
        context: context,
        builder: (BuildContext constext) {
          return AlertDialog(
            title: Text('คุณแน่ใจใช่ไหม ?'),
            content: Text('คุณต้องการที่จะลบรายการนี้?'),
            actions: <Widget>[
              FlatButton(
                child: Text('ยกเลิก', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('ใช่', style: TextStyle(color: Colors.green)),
                onPressed: () {
                  deleteData(docid).then((value) => route2(AddManual()));
                },
              ),
            ],
          );
        });
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> deleteData(String docid) async {
    await _firestore.collection("linkmanual").doc(docid).delete();
    widgets = [];
    await readAllData();
    return true;
  }

  Future<void> readAllData() async {
    // ignore: unused_local_variable
    final collectionReference = await _firestore
        .collection("linkmanual")
        // .orderBy('nameManual')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> map = Map();
                map = doc.data();
                map["docid"] = doc.id;

                setState(() {
                  widgets.add(map);

                });
                print(widgets.toList());
              })
            });
  }

  Future<void> insertData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['link'] = nameForm;
    map['nameManual'] = nameManualForm;

    setState(() {});

    await firestore.collection('linkmanual').doc().set(map).then((value) {
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
          labelText: 'ระบุ link คู่มือนักศึกษา',
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget nameManualform() {
    return TextField(
        cursorHeight: 5.0,
        maxLines: 2,
        onChanged: (value) => nameManualForm = value.trim(),
        controller: textEditController4,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'ระบุชื่อคู่มือนักศึกษา',
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

  Future<Null> route(Widget routeName, LinkModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('link', model.link);
    await preferences.setString('nameManual', model.nameManual);
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }

  Future<Null> route2(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มคู่มือนักศึกษา'),
        toolbarHeight: 40,
      ),
      body: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: textFill,
              child: ListView(children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                nameManualform(),
                SizedBox(
                  height: 10.0,
                ),
                nameform(),
                SizedBox(
                  height: 10.0,
                ),
                // )
                RaisedButton(
                  onPressed: () {
                    // ignore: curly_braces_in_flow_control_structures
                    insertData();
                    route2(AddManual());
                  },
                  child: Text('เพิ่มคู่มือ'),
                ),
                if (textEditController.text.isEmpty)
                  Text('ตัวอย่างคู่มือ')
                else
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.deepOrange,
                          child: SfPdfViewer.network(
                              '${textEditController.text}')),
                    ),
                  ),
                SizedBox(
                  height: 10.0,
                ),
                showListdata(),
              ])),
        )),
      ),
    );
  }
}
