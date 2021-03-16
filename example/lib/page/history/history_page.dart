// import 'package:bsru/page/history/history_pag1.dart';
import 'package:flutter/material.dart';

import 'history_pag1.dart';
import 'history_pag2.dart';
import 'history_pag3.dart';

import 'history_pag4.dart';
import 'history_pag5.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple,
            toolbarHeight: 40,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text('ประวัติบ้านสมเด็จ',)),
        backgroundColor: Colors.purple[50],
        body: Stack(
          children: [
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                        primary: false,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.purple,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HistoryPag1());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/histo1.png',
                                  height: 60,
                                  // width: 100,
                                ),
                                Text(
                                  'ประวัติมหาวิทยาลัย',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.purple,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HistoryPag2());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/parchment.png',
                                  height: 60,
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        'ประวัติ',
                                        style: TextStyle(
                                            fontSize: 14.0, color: Colors.white,),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'สมเด็จเจ้าพระยาฯ',
                                        style: TextStyle(
                                            fontSize: 14.0, color: Colors.white,),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.purple,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HistoryPag3());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/BSRUhis.png',
                                  height: 100,
                                ),
                                Text(
                                  'ตราสัญลักษณ์',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.purple,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HistoryPag4());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/knowledge.png',
                                  height: 80,
                                ),
                                Text(
                                  'วิสัยทัศน์ พันธกิจ',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.purple,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HistoryPag5());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/executive.png',
                                  height: 100,
                                ),
                                Text(
                                  'ทำเนียบผู้บริหาร',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
