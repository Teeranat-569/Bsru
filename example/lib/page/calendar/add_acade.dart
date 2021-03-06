// import 'package:bsru/page/calendar/acadeCal_Model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'acadeCal_Model.dart';

class CalendarPageAca extends StatefulWidget {
  @override
  _CalendarPageAcaState createState() => _CalendarPageAcaState();
}

class _CalendarPageAcaState extends State<CalendarPageAca> {
  List<dynamic> widgets2 = [];
  String dateStart;
  String dateEnd;
  String name;
  CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('AcadeCal');
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    readAlldata3();
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
            widgets2.add(model2);
            dateStart = model2.datetimeStart;
            dateEnd = model2.datetimeEnd;
            name = model2.eventname;
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

  Widget showListdata() {
    return RefreshIndicator(
      onRefresh: readAlldata3,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 12),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widgets2.length,
        itemBuilder: (context, index) {
          // ignore: deprecated_member_use
          return Stack(children: [
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                height: MediaQuery.of(context).size.height - 440,
                width: MediaQuery.of(context).size.width,

                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      // height: 60,
                      color: Colors.black,
                      // decoration: BoxDecoration(
                      //   color: Colors.green[100],
                      //   borderRadius: BorderRadius.circular(40),
                      // ),
                      child: Center(
                        child: Text(
                          '${widgets2[index].eventname}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              // fontSize: 16.0,
                              color: Colors.cyan),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 60,
                      color: Colors.white,
                      // decoration: BoxDecoration(
                      //   color: Colors.green[100],
                      //   borderRadius: BorderRadius.circular(40),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "?????????????????????????????????",
                                style: TextStyle(
                                    // fontSize: 16.0
                                    ),
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${widgets2[index].datetimeStart}',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.cyan),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 60,
                      color: Colors.white,
                      // decoration: BoxDecoration(
                      //   color: Colors.green[100],
                      //   borderRadius: BorderRadius.circular(40),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "???????????????????????????????????????",
                                style: TextStyle(
                                    // fontSize: 16.0
                                    ),
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (widgets2[index].datetimeEnd == null)
                                Text(
                                  '???????????????',
                                  style: TextStyle(color: Colors.cyan),
                                ),
                              if (widgets2[index].datetimeEnd != null)
                                Text(
                                  '${widgets2[index].datetimeEnd}',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.cyan),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 318,
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Center(
                //                 child: Container(
                //                   color: Colors.deepOrange[50],
                //                   height: 100,
                //                   width: 159,
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(3.0),
                //                     child: Column(
                //                       children: [
                //                         Text('?????????????????????????????????'),
                //                         Text(
                //                           '${widgets3[index].datetimeStart}',
                //                           style: TextStyle(fontSize: 14.0),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Center(
                //                 child: Container(
                //                   color: Colors.deepPurple[50],
                //                   height: 100,
                //                   width: 159,
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(3.0),
                //                     child: Column(
                //                       children: [
                //                         Text('???????????????????????????????????????'),
                //                         Text(
                //                           '${widgets3[index].datetimeEnd}',
                //                           style: TextStyle(fontSize: 14.0),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Container(
                //             color: Colors.white,
                //             child: Center(
                //               child: Text(
                //                 '${widgets3[index].eventname}',
                //                 style: TextStyle(fontSize: 18.0),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
          ]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.white,
            height: 1,
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
      //   actions: [ IconButton(
      //             onPressed: () {
      //               fl();

      //               Navigator.of(context).pushAndRemoveUntil(
      //                   MaterialPageRoute(builder: (context) => Add()),
      //                   (route) => false);
      //             },
      //             icon: Icon(Icons.delete),
      //           )],
      //     toolbarHeight: 40,
      //     backgroundColor: Colors.purple,
      //     leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: Icon(Icons.arrow_back_ios),
      //     ),
      //     title: Text('??????????????????????????????????????? ???????????????????????????????????????',style: TextStyle(fontSize: 16),)),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFffffff),
                const Color(0xF00796e),
              ],
            ),
          ),
          child: widgets2.length == 0
              ? Center(
                  child: Text('??????????????????????????????????????????????????????',
                      style: TextStyle(color: Colors.grey, fontSize: 22)))
              : showListdata()),
    ));
  }
}
