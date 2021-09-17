import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/Calendar.dart';
import 'package:flutter_google_maps_example/page/admin/add_Manual.dart';
import 'package:flutter_google_maps_example/page/admin/calendar_page.dart';
import 'package:flutter_google_maps_example/page/admin/registerAdmin.dart';

import '../../home.dart';
import 'upPic.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ผู้ดูแลระบบ',
          // style: TextStyle(fontSize: 14),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // MaterialPageRoute materialPageRoute = MaterialPageRoute(
                //     builder: (BuildContext context) => Admin());
                // Navigator.of(context).pushAndRemoveUntil(
                //     materialPageRoute, (Route<dynamic> route) => false);
                myAlert();
              }),
        ],
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     onPressed: () {
        //       // MaterialPageRoute materialPageRoute =
        //       //     MaterialPageRoute(builder: (BuildContext context) => Home());
        //       // Navigator.of(context).pushAndRemoveUntil(
        //       //     materialPageRoute, (Route<dynamic> route) => false);

        //     }),
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.all(10),
                      color: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        route(Calendar_Admin());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'แก้ไขปฏิทินและการลงทะเบียน',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ignore: deprecated_member_use
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.all(10),
                      color: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        route(AddManual());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'เพิ่มคู่มือนักศึกษา',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  // RaisedButton(
                  //   padding: EdgeInsets.all(10),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(30.0),
                  //   ),
                  //   onPressed: () {
                  //     route(CalendarPageAc());
                  //   },
                  //   child: Text(
                  //     'ปฏิทินวิชาการ',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   // ignore: deprecated_member_use
              //   child: RaisedButton(
              //     padding: EdgeInsets.all(10),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     onPressed: () {
              //       route(Upload());
              //     },
              //     child: Text(
              //       'แก้ไขคู่มือนักศึกษา',
              //       style: TextStyle(fontSize: 26),
              //     ),
              //   ),
              // ),
            ],
          ),
        )),
      ),
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              title: Text(
                'ลงชื่อออก',
                style: TextStyle(fontFamily: 'Kanit'),
              ),
              content: Text('คุณต้องการลงชื่อออกหรือไม่?'),
              actions: <Widget>[
                cancleButton(),
                okButton(),
              ]);
        });
  }

  Widget cancleButton() {
    // ignore: deprecated_member_use
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.grey[200],
      onPressed: () {
        Navigator.of(context).pop();
        // route(Bar());
      },
      child: Text(
        'ยกเลิก',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget okButton() {
    // ignore: deprecated_member_use
    return FlatButton(
      color: Colors.grey[200],
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      onPressed: () {
        signOut();
      },
      child: Text(
        'ตกลง',
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => Admin());
    await Navigator.of(context)
        .pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);
    print('successssssssss');
  }
}
