import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Studentnew extends StatefulWidget {
  @override
  _StudentnewState createState() => _StudentnewState();
}

class _StudentnewState extends State<Studentnew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.purple,
              ),
            ),
            toolbarHeight: 40,
            elevation: 0.0,
            title: Text('นักศึกษาใหม่', style: TextStyle(color: Colors.purple)),
            backgroundColor: Colors.purple[50]),
        backgroundColor: Colors.purple[50],
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 5,
                        crossAxisCount: 1,
                        childAspectRatio: 16 / 3,
                        primary: false,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.yellow[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website(
                                  'http://202.29.54.207/dev3/admission/payment.php');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/studentNew.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'ตรวจสอบการ',
                                      style: TextStyle(
                                        // fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'สมัคร',
                                      style: TextStyle(
                                        // fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.red[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/vtr/');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/multimedia.png',
                                  height: 75,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text('VTR แนะนำ',
                                    style: TextStyle(
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.amber[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/apartment/');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/flat.png',
                                  height: 75,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'ค้นหา',
                                      style: TextStyle(
                                        // fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'หอพักนักศึกษา',
                                      style: TextStyle(
                                        // fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          RaisedButton(
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/rules/');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/certificate.png',
                                  height: 75,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text('กฎระเบียบ',
                                    style: TextStyle(
                                      // fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('แต่งกาย',
                                    style: TextStyle(
                                      // fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('ผ่อนผันทหาร',
                                    style: TextStyle(
                                      // fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.tealAccent[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website(
                                  'https://dsad.bsru.ac.th/newdsad/nurse-and-accident.html');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/nurse.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('งานพยาบาล',
                                    style: TextStyle(
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('ประกันอุบัติเหตุ',
                                    style: TextStyle(
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.deepOrange[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/facility/');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/sofa.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('สิ่งอำนวยความ',
                                    style: TextStyle(
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('สะดวก',
                                    style: TextStyle(
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
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

Future<Null> website(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Couid not launch $url';
  }
}
