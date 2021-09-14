import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_google_maps_example/main.dart';
import 'package:flutter_google_maps_example/page/calendar/manual_page2.dart';
import 'package:flutter_google_maps_example/page/admin/web_view_container.dart';
import 'package:flutter_google_maps_example/page/student/student_new.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'page/admin/registerAdmin.dart';
import 'page/agency_pages/agency_page.dart';
// import 'page/calendar/calendar_page.dart';
import 'page/contact/contact_page.dart';
import 'page/course/course_page.dart';
import 'page/download/download_page.dart';
import 'page/history/history_page.dart';
import 'page/information_page.dart';
import 'page/manual/manual_page.dart';
// import 'page/map/map_page.dart';
import 'page/modelPIC.dart';
// import 'page/news/news_page.dart';
// import 'page/news_page.dart';
import 'page/news/news_page.dart';
import 'page/people_page.dart';
import 'page/student/student_page.dart';
// import 'web_view_container.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String pic;

  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    readAlldata3();
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded != null || isFirstLoaded == null) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            backgroundColor: Color(0xff762A76),
            // backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text('รับสมัคร',
                //     style: TextStyle(fontSize: 30, color: Colors.white)),
                // Text('นักศึกษาใหม่',
                //     style: TextStyle(fontSize: 30, color: Colors.white)),
                // SizedBox(
                //   height: 20,
                // ),
                Image.asset(
                  'images/bsru_purple.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/page_gif.gif',
                  fit: BoxFit.cover,
                ),
                // Image.network('$pic'),
                SizedBox(
                  height: 20,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Color(0xff520140),
                  onPressed: () async {
                    const url =
                        'http://202.29.54.207/dev3/admission/index.php?fbclid=IwAR0v2FiZKU0IvXeC6aYZqnjgKpcp6OYg6ydZsDN_mq2J17lvf-5nPp4c5vs';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text(
                    'สมัครเลย!!',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  "Close X",
                  style: TextStyle(color: Colors.deepPurple),
                ),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  prefs.setBool(keyIsFirstLoaded, false);
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      // ignore: await_only_futures
      await FirebaseFirestore.instance
          .collection('UpPIC')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          PicModel model2 = PicModel.fromMap(map);

          setState(() {
            // widgets.add(model2);
            pic = model2.pic;
            print(
                '33333333333333333333333333333333333333333333333333333333$pic');
          });
        }
      });
    });
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  Future _launchURLFace() async {
    const url = 'https://www.facebook.com/bsrunews';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _launchURLWeb() async {
    const url = 'https://www.bsru.ac.th/ ';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _launchURLMAp() async {
    const url = 'https://maps.app.goo.gl/DKoiVgDkk7bYTJSY7';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.purple[50],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.purple.shade50,
          child: Container(
            height: 82,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage('images/footer.png'),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/address.png',
                        height: 18,
                      ),
                      Text(
                        '1061',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontFamily: 'Sarabun'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ซอยอิสรภาพ 15',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ถนนอิสรภาพ',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'แขวงหิรัญรูจี',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'เขตธนบุรี กทม. 10600',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ImageButton(
                      //   children: <Widget>[],
                      //   width: 25,
                      //   height: 25,
                      //   pressedImage: Image.asset(
                      //     'images/facebook.png',
                      //   ),
                      //   unpressedImage: Image.asset('images/facebook.png'),
                      //   onTap: () {
                      //     print('history');
                      //     _launchURLFace();
                      //   },
                      // ),
                      IconButton(
                          onPressed: () {
                            print('facebook');
                            _launchURLFace();
                          },
                          icon: Icon(
                            Icons.facebook,
                            size: 25,
                          )),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // ImageButton(
                      //   children: <Widget>[],
                      //   width: 25,
                      //   height: 25,
                      //   pressedImage: Image.asset(
                      //     'images/domain.png',
                      //   ),
                      //   unpressedImage: Image.asset('images/domain.png'),
                      //   onTap: () {
                      //     print('history');

                      //     _launchURLWeb();
                      //   },
                      // ),
                      IconButton(
                          onPressed: () {
                            print('web');
                            _launchURLWeb();
                          },
                          icon: Icon(
                            Icons.public,
                            size: 25,
                          )),
                      // ImageButton(
                      //   children: <Widget>[],
                      //   width: 25,
                      //   height: 25,
                      //   pressedImage: Image.asset(
                      //     'images/user.png',
                      //   ),
                      //   unpressedImage: Image.asset('images/user.png'),
                      //   onTap: () {
                      //     print('admin');
                      //     route(Admin());
                      //   },
                      // ),
                      IconButton(
                          onPressed: () {
                            print('admin');
                            print('admin');
                            route(Admin());
                          },
                          icon: Icon(
                            Icons.account_box,
                            size: 25,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child:
              // appBar: AppBar(toolbarHeight: 20,),

              Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //    ClipPath(
                // clipper: WaveClipperOne(),
                // child: Container(
                //   height: 120,
                //   color: Color(0xfff6a5ec),
                //   child: Center(child: Text("WaveClipperOne()")),
                // ),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xfff6a5ec),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(200.0),
                    ),
                    // image: DecorationImage(
                    //     image: AssetImage('images/Home.png'), fit: BoxFit.cover),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Center(
                              child: Image.asset(
                                'images/bsru-1.png',
                                width: 200,
                              ),
                            ),
                          ),

                          //
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              color: Color(0xfff6a5ec)),
                          child: Image.asset(
                            'images/Logo_BSRU.png',
                            height: 108,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       ImageButton(
                //         children: <Widget>[],
                //         width: 25,
                //         height: 25,
                //         pressedImage: Image.asset(
                //           'images/facebook.png',
                //         ),
                //         unpressedImage: Image.asset('images/facebook.png'),
                //         onTap: () {
                //           print('history');
                //           _launchURLFace();
                //         },
                //       ),
                //       SizedBox(
                //         width: 5,
                //       ),
                //       ImageButton(
                //         children: <Widget>[],
                //         width: 30,
                //         height: 30,
                //         pressedImage: Image.asset(
                //           'images/domain.png',
                //         ),
                //         unpressedImage: Image.asset('images/domain.png'),
                //         onTap: () {
                //           print('history');

                //           _launchURLWeb();
                //         },
                //       ),
                //       ImageButton(
                //         children: <Widget>[],
                //         width: 30,
                //         height: 30,
                //         pressedImage: Image.asset(
                //           'images/user.png',
                //         ),
                //         unpressedImage: Image.asset('images/user.png'),
                //         onTap: () {
                //           print('admin');
                //           route(Admin());
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              historyButton(),
                              newsButton(),
                              agencyButton(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              peopleButton(),
                              studentButton(),
                              calendarButton(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              courseButton(),
                              informationButton(),
                              moreButton(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              downloadButton(),
                              mapButton(),
                              contactButton(),
                            ],
                          ),
                        ),
                        // RaisedButton(onPressed: () {
                        //         route(AddEvent());
                        //       }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget historyButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 65,
              height: 65,
              pressedImage: Image.asset(
                'images/history-book.png',
              ),
              unpressedImage: Image.asset('images/history-book.png'),
              onTap: () {
                print('history');
                route(HistoryPage());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'เกี่ยวกับ',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          'บ้านสมเด็จฯ',
          style: TextStyle(fontSize: 12),
        ))
      ],
    );
  }

  Widget informationButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 60,
              height: 65,
              pressedImage: Image.asset(
                'images/information.png',
              ),
              unpressedImage: Image.asset('images/information.png'),
              onTap: () async {
                print('test');
                route(ManualPage());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'คู่มือ',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          'นักศึกษา',
          style: TextStyle(fontSize: 12),
        ))
      ],
    );
  }

  Widget peopleButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 70,
              height: 75,
              pressedImage: Image.asset(
                'images/person.png',
              ),
              unpressedImage: Image.asset('images/person.png'),
              onTap: () {
                print('test');
                route(PeoplePage());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'บุคลากร',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget agencyButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 60,
              height: 65,
              pressedImage: Image.asset(
                'images/penitentiary.png',
              ),
              unpressedImage: Image.asset('images/penitentiary.png'),
              onTap: () {
                print('หน่วยงาน');
                route(AgencyPage());
              },
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
            child: Text(
          'ตณะ',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          'หน่วยงาน',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget courseButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 60,
              height: 65,
              // paddingTop: 5,
              pressedImage: Image.asset(
                'images/22.png',
              ),
              unpressedImage: Image.asset('images/22.png'),
              onTap: () {
                print('test');
                route(CoursePage());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'หลักสูตร',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          'ที่เปิดสอน',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget mapButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 65,
              height: 55,
              pressedImage: Image.asset(
                'images/map.png',
              ),
              unpressedImage: Image.asset('images/map.png'),
              onTap: () {
                print('test');
                // route(MapPage());
                // _launchURLMAp();
                route(MyHomePage());
                // AppCompatActivity();
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'แผนที่ มบส.',
          style: TextStyle(fontSize: 12),
        ))
      ],
    );
  }

  Widget contactButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 60,
              height: 65,
              pressedImage: Image.asset(
                'images/contact.png',
              ),
              unpressedImage: Image.asset('images/contact.png'),
              onTap: () {
                print('test');
                route(ContactPage());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'ติดต่อ มบส.',
          style: TextStyle(fontSize: 12),
        ))
      ],
    );
  }

  Widget newsButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 60,
              height: 65,
              pressedImage: Image.asset(
                'images/news.png',
              ),
              unpressedImage: Image.asset('images/news.png'),
              // onTap: () {
              //   print('test');
              //   // route(Homenews());
              //   route(NewsPage());
              // },
              onTap: () async {
                const url = 'https://bsru.ac.th/news';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Couid not launch $url';
                }
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'ข่าวสาร',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          'กิจกรรม',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget calendarButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 60,
              height: 65,
              pressedImage: Image.asset(
                'images/schedule.png',
              ),
              unpressedImage: Image.asset('images/schedule.png'),
              onTap: () {
                print('test');
                route(ManualPage2());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'ปฏิทินกิจกรรม',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          'ปฏิทินวิชาการ',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget moreButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 60,
              height: 65,
              pressedImage: Image.asset(
                'images/66.png',
              ),
              unpressedImage: Image.asset('images/66.png'),
              onTap: () {
                print('test');
                route(InformationPage());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'ระบบสารสนเทศ',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget studentButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 70,
              height: 75,
              pressedImage: Image.asset(
                'images/employee.png',
              ),
              unpressedImage: Image.asset('images/employee.png'),
              onTap: () {
                print('test');
                route(Studentnew());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'นักศึกษา',
          style: TextStyle(fontSize: 12),
        )),
        Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget downloadButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/buttonBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageButton(
              children: <Widget>[],
              width: 55,
              height: 65,
              pressedImage: Image.asset(
                'images/file.png',
              ),
              unpressedImage: Image.asset('images/file.png'),
              onTap: () {
                print('test');
                route(DownloadPage());
              },
            ),
          ),
        ),
        Center(
            child: Text(
          'ดาวน์โหลดเอกสาร',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }
}
