import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/admin/add_Activity3.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'acadeCalspe_model2Str.dart';

void main() => runApp(Calendar3_Admin());

class Calendar3_Admin extends StatefulWidget {
  @override
  _Calendar3_AdminState createState() => _Calendar3_AdminState();
}

class _Calendar3_AdminState extends State<Calendar3_Admin> {
  String path, link3;
  List<dynamic> widgets2 = [];

  @override
  initState() {
    super.initState();
    // loadPdf();
    readAlldata3();
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
        'https://mis4.bsru.ac.th/registrar/Download/file_download/register2564-1sp.pdf');
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
          .collection('AcadeCalspecial')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          AcadeCalspecial model2 = AcadeCalspecial.fromMap(map);

          setState(() {
            widgets2.add(model2);
            link3 = model2.link3;
            print(
                '//////////////////////////////////////////////////////$link3');
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
           floatingActionButton: FloatingActionButton(
          onPressed: () {
            // insertData();
            // addUser();
            route(Activity3());
            // collection.doc('15bfjhVepH732Wn0Jesn').get(link);

            // Fluttertoast.showToast(
            //   msg: "เพิ่มกิจกรรมสำเร็จ",
            //   toastLength: Toast.LENGTH_SHORT,
            //   gravity: ToastGravity.CENTER,
            //   backgroundColor: Colors.purple[100],
            //   textColor: Colors.black,
            // );
          },
          child: Column(
            children: [
              Icon(
                Icons.edit,
                size: 30.0,
              ),
              Text(
                'แก้ไข',
                style: TextStyle(fontFamily: 'Sarabun'),
              )
            ],
          ),
          backgroundColor: Colors.orange[900],
          tooltip: 'บันทึกกิจกรรม',
        ),
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (link3 != null)
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
                      child: SfPdfViewer.network('$link3')),
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
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
