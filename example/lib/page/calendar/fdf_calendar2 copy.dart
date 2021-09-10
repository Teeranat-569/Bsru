import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/acadeCal_model2Str.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() => runApp(Calendar2());

class Calendar2 extends StatefulWidget {
  @override
  _Calendar2State createState() => _Calendar2State();
}

class _Calendar2State extends State<Calendar2> {
  String path, link2;
  List<dynamic> widgets2 = [];

  @override
  initState() {
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
          AcadeModel model2 = AcadeModel.fromMap(map);

          setState(() {
            widgets2.add(model2);
            link2 = model2.link2;
            // uri = Uri.parse('$link');
            // print('0000000000000000000000000000000000000$uri');
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'กำหนดการลงทะเบียนเรียน ภาคปกติ',
                style: TextStyle(fontFamily: 'Pridi', fontSize: 17),
              ),
            ),
            if (link2 != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.deepOrange,
                      child: SfPdfViewer.network('$link2')),
                ),
              )
            else

              // Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              // children: [
              Center(
                  child: Column(
                children: [
                  CircularProgressIndicator(),
                  Text(
                    'กำลังดาวน์โหลดเอกสาร',
                    style: TextStyle(fontFamily: 'Pridi'),
                  ),
                  Text(
                    'โปรดรอสักครู่...',
                    style: TextStyle(fontFamily: 'Pridi'),
                  ),
                ],
              ))
          ],
        ),
      ),
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
