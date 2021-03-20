import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Studentold extends StatefulWidget {
  @override
  _StudentoldState createState() => _StudentoldState();
}

class _StudentoldState extends State<Studentold> {
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
            title: Text('นักศึกษาปัจจุบัน',
                style: TextStyle(color: Colors.purple)),
            backgroundColor: Colors.purple[50]),
        backgroundColor: Colors.purple[50],
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
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
                            color: Colors.pink[100],
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
                                  'images/web11.png',
                                  height: 60,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'ระบบ MIS',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.blue[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/elearning/');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/world-grid.png',
                                  height: 60,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('e-Learning',
                                    style: TextStyle(
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.yellow[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website(
                                  'https://dsad.bsru.ac.th/newdsad/scholarship.html');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/scholarship.png',
                                  height: 60,
                                ),
                                 SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'ทุนการศึกษา',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.brown[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website(
                                  'https://dsad.bsru.ac.th/newdsad/studentloan.html');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/briefcase.png',
                                  height: 60,
                                ),
                                 SizedBox(
                                  width: 20,
                                ),
                                Text('กยศ.',
                                    style: TextStyle(
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ))
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
