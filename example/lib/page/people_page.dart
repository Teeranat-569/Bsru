import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.purple,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            toolbarHeight: 40,
            elevation: 0.0,
            title: Text(
              'บุคลากร',
              style: TextStyle(color: Colors.purple),
            ),
            backgroundColor: Colors.purple[50]),
        backgroundColor: Colors.purple[50],
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 16 / 7,
                        primary: false,
                        children: <Widget>[
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://logon.bsru.ac.th/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/key11.png',
                                  height: 30,
                                ),
                                Text(
                                  'Login SuriyaNet',
                                  style: TextStyle(
                                    // fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text(
                                //       'เข้าระบบ',
                                //       style: TextStyle(
                                //         fontSize: 12.0,
                                //         color: Colors.purple[900],
                                //       ),
                                //     ),
                                //     Text(
                                //       'Authenticate',
                                //       style: TextStyle(
                                //         fontSize: 12.0,
                                //         color: Colors.purple[900],
                                //       ),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://mis.bsru.ac.th/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/web11.png',
                                  height: 30,
                                ),
                                Text(
                                  'ระบบ MIS',
                                  style: TextStyle(
                                    // fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text(
                                //       'ตารางสอน',
                                //       style: TextStyle(
                                //         fontSize: 15.0,
                                //         color: Colors.purple[900],
                                //       ),
                                //     ),
                                //     Text(
                                //       'บันทึกเกรด',
                                //       style: TextStyle(
                                //         fontSize: 15.0,
                                //         color: Colors.purple[900],
                                //       ),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website(
                                  'http://erp.bsru.ac.th/ERPWEB/Main/Home.aspx');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/diagram.png',
                                  height: 40,
                                ),
                                Text(
                                  'ERP WEB',
                                  style: TextStyle(
                                    // fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text('ข้อมูลบุคลากร',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //     Text('ผ่านเว็บไซต์',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website(
                                  'http://erpmis.bsru.ac.th/VNCaller/login.aspx?redirect=applications.aspx');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/business.png',
                                  height: 40,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'VNCaller',
                                      style: TextStyle(
                                        // fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // Text(
                                    //   '(ERP|MIS)',
                                    //   style: TextStyle(
                                    //     // fontSize: 16.0,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                // Text('ระบบ Back Office',
                                //     style: TextStyle(
                                //       fontSize: 15.0,
                                //       color: Colors.purple[900],
                                //     ))
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://doc.bsru.ac.th/DocClient/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/document.png',
                                  height: 30,
                                ),
                                Text(
                                  'e-Document',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text('สารบรรณ',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //     Text('อิเล็กทรอนิกส์',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://welfare.bsru.ac.th/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/pie-chart.png',
                                  height: 30,
                                ),
                                Text(
                                  'Welfare',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text('เบิกจ่ายสวัสดิการ',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //     Text('พนักงาน',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('https://www.bsru.ac.th/elearning/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/world-grid.png',
                                  height: 30,
                                ),
                                Text(
                                  'e-Learning',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Text('สื่อการสอนออนไลน์',
                                //     style: TextStyle(
                                //       fontSize: 15.0,
                                //       color: Colors.purple[900],
                                //     ))
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://brms.bsru.ac.th/bsru_research/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/seo.png',
                                  height: 30,
                                ),
                                Text(
                                  'BRMS',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Text('สืบค้นฐานข้อมูลวิจัย',
                                //     style: TextStyle(
                                //       fontSize: 15.0,
                                //       color: Colors.purple[900],
                                //     ))
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://booking.bsru.ac.th/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/calendar.png',
                                  height: 30,
                                ),
                                Text(
                                  'Room Booking',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    // height: 1.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text('ระบบจองห้องอบรม/',
                                //         style: TextStyle(
                                //           // fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //     Text('ประชุม',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://car.bsru.ac.th/login.php');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/steering-wheel.png',
                                  height: 40,
                                ),
                                Text(
                                  'Car Booking',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text('ระบบขอใช้รถยนต์',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //     Text('ราชการ',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('http://plag.grad.chula.ac.th/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/ff.jpg',
                                  height: 60,
                                ),
                                // Text(
                                //   'อักขราวิสุทธิ์',
                                //   style: TextStyle(
                                //     // fontSize: 18.0,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // Column(
                                //   children: [
                                //     Text('ตรวจการลอกเลียน',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //     Text('วรรณกรรมวิชาการ',
                                //         style: TextStyle(
                                //           fontSize: 15.0,
                                //           color: Colors.purple[900],
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            // elevation: 16,
                            onPressed: () {
                              website('https://www.office.com/');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/email.png',
                                  height: 40,
                                ),
                                Text(
                                  'BSRU-Mail',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Text('Google Education',
                                //     style: TextStyle(
                                //       fontSize: 15.0,
                                //       color: Colors.purple[900],
                                //     )),
                                // Text('Office365',
                                //     style: TextStyle(
                                //       fontSize: 15.0,
                                //       color: Colors.purple[900],
                                //     ))
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
