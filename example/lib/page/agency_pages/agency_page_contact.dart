import 'package:flutter/material.dart';

import 'contact/agency_eightPage.dart';
// import 'contact/agency_eightteenPage.dart';
import 'contact/agency_elevenPage.dart';
import 'contact/agency_fifteenPage.dart';
import 'contact/agency_fivePage.dart';
import 'contact/agency_fourPage.dart';
import 'contact/agency_fourteenPage.dart';
import 'contact/agency_ninePage.dart';
import 'contact/agency_nineteenPage.dart';
import 'contact/agency_onePage.dart';
import 'contact/agency_sevenPage.dart';
import 'contact/agency_seventeenPage.dart';
import 'contact/agency_sixPage.dart';
import 'contact/agency_sixteenPage.dart';
import 'contact/agency_tenPage.dart';
import 'contact/agency_thirteenPage.dart';
import 'contact/agency_threePage.dart';
import 'contact/agency_twelvePage.dart';
import 'contact/agency_twentyPage.dart';
import 'contact/agency_twentyonePage.dart';
import 'contact/agency_twentytwoPage.dart';
import 'contact/agency_twoPage.dart';

class AgencyPageContact extends StatefulWidget {
  @override
  _AgencyPageContactState createState() => _AgencyPageContactState();
}

class _AgencyPageContactState extends State<AgencyPageContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     toolbarHeight: 40,
      //     backgroundColor: Colors.purple,
      //     leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: Icon(Icons.arrow_back),
      //     ),
      //     title: Text('หน่วยงาน'))
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          "หน่วยงาน",
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 40,
        elevation: 0.00,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.purple[100],
        child: showGrid(),
      ),
    );
  }

  Widget showGrid() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      childAspectRatio: 16 / 3.5,
      children: <Widget>[
        agency_one(),
        agency_two(),
        agency_three(),
        agency_four(),
        agency_five(),
        agency_six(),
        agency_seven(),
        agency_eight(),
        agency_nine(),
        agency_ten(),
        agency_eleven(),
        agency_twelve(),
        agency_thirteen(),
        agency_fourteen(),
        agency_fifteen(),
        agency_sixteen(),
        agency_sixteen(),
        // agency_eightteen(),
        agency_nineteen(),
        agency_twenty(),
        agency_twentyone(),
        agency_twentytwo()
      ],
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      agency_one() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencyOne());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักงานอธิการบดี',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      agency_two() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencyTwo());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'กองบริหารงานบุคคล',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      agency_three() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencyThree());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'กองกลาง',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      agency_four() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencyFour());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'กองอาคารสถานที่และสิ่งแวดล้อม',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      agency_five() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencyFive());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'กองนโยบายและแผน',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton

      // ignore: non_constant_identifier_names
      agency_six() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencySix());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'งานประกันคุณภาพการศึกษา',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton

      // ignore: non_constant_identifier_names
      agency_seven() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencySeven());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'กองคลัง',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      agency_eight() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencyEight());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'งานพ้สดุ',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  // ignore: deprecated_member_use
  RaisedButton agency_nine() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(AgencyNine());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักส่งเสริมวิชาการและงานทะเบียน',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  // ignore: deprecated_member_use
  RaisedButton agency_ten() {
    return RaisedButton(
        onPressed: () {
          route(AgencyTen());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักกิจการนักศึกษา',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_eleven() {
    return RaisedButton(
        onPressed: () {
          route(AgencyEleven());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักประชาสัมพันธ์และสารสนเทศ',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_twelve() {
    return RaisedButton(
        onPressed: () {
          route(AgencyTwelve());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักคอมพิวเตอร์',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_thirteen() {
    return RaisedButton(
        onPressed: () {
          route(AgencyThirteen());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักวิเทศสัมพันธ์และเครือข่ายอาเซียน',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_fourteen() {
    return RaisedButton(
        onPressed: () {
          route(AgencyFourteen());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักวิทยบริการและเทคโนโลยีสารสนเทศ',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_fifteen() {
    return RaisedButton(
        onPressed: () {
          route(AgencyFifteen());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักศิลปะและวัฒนธรรม',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_sixteen() {
    return RaisedButton(
        onPressed: () {
          route(AgencySixteen());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สำนักงานสภามหาวิทยาลัย',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_seventeen() {
    return RaisedButton(
        onPressed: () {
          route(AgencySeventeen());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สถาบันวิจัยและพัฒนา (สวพ.)',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  // RaisedButton agency_eightteen() {
  //   return RaisedButton(
  //       onPressed: () {
  //         route(AgencyEightteen());
  //       },
  //       padding: const EdgeInsets.all(5),
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: Row(
  //           children: [
  //             Text(
  //               'สถาบันขงจื๊อ',
  //               // style: TextStyle(fontSize: 18),
  //             ),
  //           ],
  //         ),
  //       ),
  //       color: Colors.white,
  //       shape: new RoundedRectangleBorder(
  //           borderRadius: new BorderRadius.circular(10.0)));
  // }

  // ignore: non_constant_identifier_names
  RaisedButton agency_nineteen() {
    return RaisedButton(
        onPressed: () {
          route(AgencyNineteen());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'หน่วยตรวจสอบภายใน',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_twenty() {
    return RaisedButton(
        onPressed: () {
          route(AgencyTwenty());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สภาวิชาการ',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_twentyone() {
    return RaisedButton(
        onPressed: () {
          route(AgencyTwentyone());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'สภาคณาจารย์และข้าราชการ',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: non_constant_identifier_names
  RaisedButton agency_twentytwo() {
    return RaisedButton(
        onPressed: () {
          route(AgencyTwentytwo());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Academic Collaboration on Thai Language and Culture for Foreign Students',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: false,
                // style: TextStyle(fontSize: 12),
              ),
              // Text(
              //   '',
              //   // style: TextStyle(fontSize: 12),
              // ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)));
  }
}
