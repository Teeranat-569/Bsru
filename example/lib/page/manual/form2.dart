import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String path;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPdf();
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

  Future<bool> existsFile() async {
    final file = await _localFile;
    return file.exists();
  }

  Future<Uint8List> fetchPost() async {
    final response = await http.get(
        // 'https://expoforest.com.br/wp-content/uploads/2017/05/exemplo.pdf'
        // 'https://firebasestorage.googleapis.com/v0/b/bsru-app.appspot.com/o/manual%2F%E0%B9%80%E0%B8%AA%E0%B9%89%E0%B8%99%E0%B8%97%E0%B8%B2%E0%B8%87%E0%B8%AA%E0%B8%B9%E0%B9%88%E0%B8%9A%E0%B8%B1%E0%B8%93%E0%B8%91%E0%B8%B4%E0%B8%952560-2561.pdf?alt=media&token=0cbdea3e-f699-4fa2-8fec-ea8ec9c41bbd');
// 'https://firebasestorage.googleapis.com/v0/b/bsru-app.appspot.com/o/manual%2F%E0%B9%80%E0%B8%AA%E0%B9%89%E0%B8%99%E0%B8%97%E0%B8%B2%E0%B8%87%E0%B8%AA%E0%B8%B9%E0%B9%88%E0%B8%9A%E0%B8%B1%E0%B8%93%E0%B8%91%E0%B8%B4%E0%B8%952560-2561.pdf?alt=media&token=0cbdea3e-f699-4fa2-8fec-ea8ec9c41bbd');
    'https://firebasestorage.googleapis.com/v0/b/bsruapp-f3995.appspot.com/o/manual%2F%E0%B8%84%E0%B8%B9%E0%B9%88%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B9%80%E0%B8%AA%E0%B9%89%E0%B8%99%E0%B8%97%E0%B8%B2%E0%B8%87%E0%B8%AA%E0%B8%B9%E0%B9%88%E0%B8%9A%E0%B8%B1%E0%B8%93%E0%B8%91%E0%B8%B4%E0%B8%95%20%E0%B8%9B%E0%B8%B5%202563--Finish.pdf?alt=media&token=6b49f840-e455-4521-ab11-235c0f1ca84a');
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  void loadPdf() async {
    await writeCounter(await fetchPost());
    await existsFile();
    path = (await _localFile).path;

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text(
            'คู่มือนักศึกษาปีการศึกษา 2560 - 2561',
            style: TextStyle(fontSize: 16,
            fontFamily: 'Pridi'),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              if (path != null)
                Container(
                  height: 600,
                  child: PdfView(
                    path: path,
                  ),
                )
              else
                Column(
                  children: [
                    Center(child: CircularProgressIndicator()),
                    Text('กำลังดาวน์โหลดเอกสาร',style: TextStyle(fontFamily: 'Pridi'),),
                    Text('โปรดรอสักครู่...',style: TextStyle(fontFamily: 'Pridi'),),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
