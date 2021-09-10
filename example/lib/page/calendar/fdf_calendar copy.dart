import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/activityCal_model2Str.dart';
import 'package:flutter_google_maps_example/page/admin/add_Activity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() => runApp(Calendar1());

class Calendar1 extends StatefulWidget {
  @override
  _Calendar1State createState() => _Calendar1State();
}

class _Calendar1State extends State<Calendar1> {
  String path;
  dynamic link;
  var kk;
  List<dynamic> widgets2 = [];
  var collection = FirebaseFirestore.instance.collection('ActivityCal');
  Stream<DocumentSnapshot> snapshot = Firestore.instance
      .collection("ActivityCal")
      .document('15bfjhVepH732Wn0Jesn')
      .snapshots();
  Uri uri;
  // Stream<DocumentSnapshot> snapshot2 = Firestore.instance
  //     .collection("listofprods")
  //     .document('ac1')
  //     .snapshots()
  //     .get();

  // dynamic url = Uri.parse(snapshot['link1']);

  @override
  initState() {
    super.initState();
    // loadPdf();
    readAlldata3();
    // print('UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU${Uri.parse(link1)}');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/teste.pdf');
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsBytes(stream);
  }

  Future<Uint8List> fetchPost() async {
    final response = await http.get(
        // 'https://expoforest.com.br/wp-content/uploads/2017/05/exemplo.pdf');
        // 'https://firebasestorage.googleapis.com/v0/b/bsru-app.appspot.com/o/manual%2F%E0%B8%84%E0%B8%B9%E0%B9%88%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B9%80%E0%B8%AA%E0%B9%89%E0%B8%99%E0%B8%97%E0%B8%B2%E0%B8%87%E0%B8%AA%E0%B8%B9%E0%B9%88%E0%B8%9A%E0%B8%B1%E0%B8%93%E0%B8%91%E0%B8%B4%E0%B8%95%20%E0%B8%9B%E0%B8%B5%202563--Finish.pdf?alt=media&token=87ab6a34-85a7-4b24-93c7-e2a679e4ff30');
        '${Uri.parse(link)}'
        // '$uri'
        );

    final responseJson = response.bodyBytes;

    return responseJson;
  }

  loadPdf() async {
    await writeCounter(await fetchPost());
    path = (await _localFile).path;

    if (!mounted) return;

    setState(() {});
  }

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      // ignore: await_only_futures
      await FirebaseFirestore.instance
          .collection('ActivityCal')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          ActivityModel model2 = ActivityModel.fromMap(map);

          setState(() {
            widgets2.add(model2);
            link = model2.link1;

            uri = Uri.parse('$link');
            print('0000000000000000000000000000000000000$uri');
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ปฏิทินวิชาการ',
                style: TextStyle(fontFamily: 'Pridi', fontSize: 17),
              ),
            ),
            // Text(snapshot.data['link1']),
            if (link != null)
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   child: PdfView(
              //     path: path,
              //   ),
              // )
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.deepOrange,
                      child: SfPdfViewer.network('$link')),
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
            //

            // ],
            // ),

            //   Text("Pdf is not Loaded"),
            // RaisedButton(
            //   child: Text("Load pdf"),
            //   onPressed: loadPdf,
            // ),
          ],
        ),
      ),
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
