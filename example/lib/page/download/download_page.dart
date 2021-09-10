import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/manual/form.dart';
import 'package:flutter_google_maps_example/page/manual/form2.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.purple[50],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
          ),
          title: Text(
            'ดาวน์โหลดเอกสาร',
            style: TextStyle(color: Colors.purple),
          )),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0), color: Colors.purple[100]),
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                  child: Text(
                'ใบคำร้อง',
                style: TextStyle(fontSize: 20),
              )),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        t1('ทบ.1 คำร้องทั่วไป',
                            'http://aar.bsru.ac.th/images/re-form/R1.pdf'),
                        t1('ทบ.2 คำร้องขอมีบัตรประจำตัวนักศึกษา',
                            'http://aar.bsru.ac.th/images/re-form/R2.pdf'),
                        t1('ทบ.4 คำร้องขอใบรายงานผลการศึกษา',
                            'http://aar.bsru.ac.th/images/re-form/R4.pdf'),
                        t1('ทบ.5 คำร้องขอใบรับรองสถานภาพ',
                            'http://aar.bsru.ac.th/images/re-form/R5.pdf'),
                        t1('ทบ.6 คำร้องขอพักการเรียน/คืนสภาพ',
                            'http://aar.bsru.ac.th/images/re-form/R6.pdf'),
                        t1('ทบ.7 คำร้องขอลาออก/ย้ายมหาวิทยาลัย',
                            'http://aar.bsru.ac.th/images/re-form/R7.pdf'),
                        t1('ทบ.8 คำร้องขอเรียนสมทบต่างมหาวิทยาลัย',
                            'http://aar.bsru.ac.th/images/re-form/R8.pdf'),
                        t1('ทบ.9 คำร้องขอยกเว้นการเรียนรายวิชา',
                            'http://aar.bsru.ac.th/images/re-form/R9.pdf'),
                        t1('ทบ.10 คำร้องขอยกเว้นกลุ่มวิชาศึกษาทั่วไป',
                            'http://aar.bsru.ac.th/images/re-form/R10.pdf'),
                        t1('ทบ.11 คำร้องขอโอนผลการเรียน',
                            'http://aar.bsru.ac.th/images/re-form/R11.pdf'),
                        t1('ทบ.12 คำร้องขอยกเลิกรายวิชา',
                            'http://aar.bsru.ac.th/images/re-form/R12.pdf'),
                        t1('ทบ.14 คำร้องขอเปิดรายวิชาเป็นกรณีพิเศษ',
                            'http://aar.bsru.ac.th/images/re-form/R14.pdf'),
                        t1('ทบ.15 คำร้องขอเปลี่ยนสาขาวิชา',
                            'http://aar.bsru.ac.th/images/re-form/R15.pdf'),
                        t1('ทบ.17 คำร้องแจ้งขอเรียนเป็นภาคเรียนสุดท้าย',
                            'http://aar.bsru.ac.th/images/re-form/R17.pdf'),
                        // button(),
                        // button2(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget t1(String name, String url) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 13),
          ),
          OutlinedButton(
            onPressed: () async {
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Couid not launch $url';
              }
            },
            child: Icon(Icons.download_sharp),
          ),
        ],
      ),
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  Widget button() {
    // ignore: deprecated_member_use
    return RaisedButton.icon(
        onPressed: () {
          route(MyApp());
        },
        icon: Icon(Icons.download_done_rounded),
        label: Text('TestTest'));
  }

  Widget button2() {
    // ignore: deprecated_member_use
    return RaisedButton.icon(
        onPressed: () {
          route(MyApp2());
        },
        icon: Icon(Icons.download_done_rounded),
        label: Text('TestTest'));
  }
}
