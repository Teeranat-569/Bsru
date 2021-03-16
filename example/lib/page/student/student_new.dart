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
        appBar: AppBar(toolbarHeight: 40,
            elevation: 0.0,
            title: Text('นักศึกษาใหม่'),
            backgroundColor: Colors.purple),
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
                        crossAxisCount: 2,
                        primary: false,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            onPressed: () {
                              website('http://202.29.54.207/dev3/admission/payment.php');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/studentNew.png',
                                  height: 80,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'ตรวจสอบการ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'สมัคร',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            onPressed: () {
                              website(
                                  'https://www.bsru.ac.th/vtr/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/multimedia.png',
                                  height: 80,
                                ),
                                Text('VTR แนะนำ',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/apartment/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/flat.png',
                                  height: 80,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'ค้นหา',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'หอพักนักศึกษา',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            onPressed: () {
                              website(
                                  'https://www.bsru.ac.th/rules/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/certificate.png',
                                  height: 80,
                                ),
                                Text('กฎระเบียบ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                    Text('แต่งกาย',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                    Text('ผ่อนผันทหาร',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            onPressed: () {
                              website(
                                  'https://dsad.bsru.ac.th/newdsad/nurse-and-accident.html');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/nurse.png',
                                  height: 80,
                                ),
                                Text('งานพยาบาล',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                    Text('ประกันอุบัติเหตุ',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/facility/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/sofa.png',
                                  height: 80,
                                ),
                                Text('สิ่งอำนวยความ',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                    Text('สะดวก',
                                    style: TextStyle(
                                      fontSize: 18.0,
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
