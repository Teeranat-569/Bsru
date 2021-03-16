// import 'package:bsru/page/calendar/activityCal_model2Str.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_google_maps_example/page/calendar/activityCal_model2Str.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List widgets2 = [];
  List<dynamic> widgets3 = [];
  String date2;
  String name;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    // readAlldata3();
    readAllData();
  }

  Future<void> readAllData() async {
    // ignore: unused_local_variable
    final collectionReference = await _firestore
        .collection("ActivityCal").orderBy('Eventname')
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
    await _firestore.collection("ActivityCal").doc(docid).delete();
    widgets2 = [];
    readAllData();
    return true;
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
                child: Text('ยกเลิก',style: TextStyle(color: Colors.red),),
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

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      await FirebaseFirestore.instance
          .collection('ActivityCal')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          ActivityCalModel3 model3 = ActivityCalModel3.fromMap(map);

          setState(() {
            widgets3.add(model3);
            date2 = model3.datetime;
            name = model3.eventname;
          });
        }
      });
    });
  }

  Future<void> updateData() async {
    CollectionReference _stocks = _firestore.collection('ActivityCal');
    DocumentReference reference = _stocks.doc();
    await reference.update({
      'Eventname': 'name',
      'DateTime': 'time',
    });
  }

  void fl() {
    FirebaseFirestore.instance.collection("ActivityCal").get().then((value) {
      value.docs.forEach((element) {
        print('*************************${element.id}');
        FirebaseFirestore.instance
            .collection("ActivityCal")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
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
        itemCount: widgets2.length,
        itemBuilder: (context, index) {
          int indexD = index + 1;
          // ignore: deprecated_member_use
          return FlatButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(width: 4, color: Colors.grey))),
                      width: 30,
                      height: 60,
                      child: Center(
                        child: Text(
                          '$indexD',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      )),
                ),
                Container(
                  width: 230,
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widgets2[index]["Eventname"],
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '${widgets2[index]["DateTime"]}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    myAlert(widgets2[index]["docid"]);
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 20,
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
      //       'ปฏิทินกิจกรรม',
      //       style: TextStyle(fontSize: 16),
      //     )),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFffffff),
                const Color(0xFFffe2e2),
              ],
            ),
          ),
          child:
              // widgets2.length == 0
              // ? Center(
              // child: Text('ไม่มีปฏิทินกิจกรรม',
              // style: TextStyle(color: Colors.grey, fontSize: 22)))
             
                 showListdata()),
    ));
  }
}
