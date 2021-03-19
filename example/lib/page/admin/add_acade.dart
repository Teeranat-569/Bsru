
// import 'package:bsru/page/calendar/acadeCal_Model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_google_maps_example/page/calendar/acadeCal_Model.dart';
import 'package:sizer/sizer.dart';

class CalendarPageAc extends StatefulWidget {
  @override
  _CalendarPageAcState createState() => _CalendarPageAcState();
}

class _CalendarPageAcState extends State<CalendarPageAc> {
  List widgets2 = [];
  List<dynamic> widgets3 = [];
  AcadeCalModel2 model3;
  DateTime date;
  String dateStart;
  String dateEnd;
  String formatted;
  String name;
  String time;
  DateTime myDateTime;
  var formatter;
  String t;
  int index;
  QuerySnapshot activity;
  DocumentSnapshot document;
  TextEditingController titleController = new TextEditingController();
  TextEditingController authorController = new TextEditingController();
  // ignore: unused_field
  CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('AcadeCal');
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    // ignore: unused_local_variable
    final collectionReference = await _firestore
        .collection("AcadeCal")
        .orderBy('DateTimeStart')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> map = Map();
                map = doc.data();
                map["docid"] = doc.id;
                setState(() {
                  widgets2.add(map);
                });
                print(widgets2.toList());
              })
            });
  }

  Future<bool> deleteData(String docid) async {
    await _firestore.collection("AcadeCal").doc(docid).delete();
    widgets2 = [];
    readAllData();
    return true;
  }

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      // ignore: await_only_futures
      await FirebaseFirestore.instance
          .collection('AcadeCal')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          AcadeCalModel2 model2 = AcadeCalModel2.fromMap(map);

          setState(() {
            widgets3.add(model2);
            dateStart = model2.datetimeStart;
            dateEnd = model2.datetimeEnd;
            name = model2.eventname;
          });
        }
      });
    });
  }

  void fl() {
    FirebaseFirestore.instance.collection("AcadeCal").get().then((value) {
      value.docs.forEach((element) {
        print('*************************${element.id}');
        FirebaseFirestore.instance
            .collection("AcadeCal")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      });
    });
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
                child: Text('ยกเลิก',style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('ใช่',style: TextStyle(color: Colors.green)),
                onPressed: () {
                  deleteData(docid)
                      .then((value) => Navigator.of(context).pop());
                },
              ),
            ],
          );
        });
  }

  Widget showListdata() {
    return RefreshIndicator(
      onRefresh: readAlldata3,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 12),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widgets2.length,
        itemBuilder: (context, index) {
          // int indexD = index + 1;
          // ignore: deprecated_member_use
          return FlatButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 318,
                  // padding: EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            '${widgets2[index]["Eventname"]}',
                            style: TextStyle(fontSize: 18.0.sp),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              color: Colors.deepOrange[50],
                              height: 100.0.h,
                              width: 159.0.w,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  children: [
                                    Text('วันที่เริ่ม'),
                                    Text(
                                      '${widgets2[index]["DateTimeStart"]}',
                                      style: TextStyle(fontSize: 14.0.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              color: Colors.deepPurple[50],
                              height: 100.0.h,
                              width: 159.0.w,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  children: [
                                    Text('วันที่สิ้นสุด'),
                                    Text(
                                      '${widgets2[index]["DateTimeEnd"]}',
                                      style: TextStyle(fontSize: 14.0.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {
                          myAlert(widgets2[index]["docid"]);
                        },
                        color: Colors.grey[350],
                        child: Center(child: Icon(Icons.delete)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 20.0.h,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
          
      //     toolbarHeight: 40,
      //     backgroundColor: Colors.purple,
      //     leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: Icon(Icons.arrow_back_ios),
      //     ),
      //     title: Text(
      //       'ปฏิทินวิชาการ',
      //       style: TextStyle(fontSize: 16),
      //     )),
      body: RefreshIndicator(onRefresh: readAlldata3,
              child: Container(
            height: MediaQuery.of(context).size.height,
            child: widgets2.length == 0
                ? Center(
                    child: Text('ไม่มีปฏิทินกิจกรรม',
                        style: TextStyle(color: Colors.grey, fontSize: 22.0.sp)))
                : RefreshIndicator(onRefresh: readAlldata3,
                  child: showListdata())),
      ),
    ));
  }
}
