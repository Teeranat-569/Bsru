import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Calendar2_Admin());

class Calendar2_Admin extends StatefulWidget {
  @override
  _Calendar2_AdminState createState() => _Calendar2_AdminState();
}

class _Calendar2_AdminState extends State<Calendar2_Admin> {
  String path;

  @override
  initState() {
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

  Future<Uint8List> fetchPost() async {
    final response = await http.get(
        // 'https://expoforest.com.br/wp-content/uploads/2017/05/exemplo.pdf');
        // 'https://firebasestorage.googleapis.com/v0/b/bsru-app.appspot.com/o/manual%2F%E0%B8%84%E0%B8%B9%E0%B9%88%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B9%80%E0%B8%AA%E0%B9%89%E0%B8%99%E0%B8%97%E0%B8%B2%E0%B8%87%E0%B8%AA%E0%B8%B9%E0%B9%88%E0%B8%9A%E0%B8%B1%E0%B8%93%E0%B8%91%E0%B8%B4%E0%B8%95%20%E0%B8%9B%E0%B8%B5%202563--Finish.pdf?alt=media&token=87ab6a34-85a7-4b24-93c7-e2a679e4ff30');
        'https://mis4.bsru.ac.th/registrar/Download/file_download/register2564-1.pdf');
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  loadPdf() async {
    await writeCounter(await fetchPost());
    path = (await _localFile).path;

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 40,
        //   title: Text('Plugin example app'),
        // ),
        body: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (path != null)
              Container(
                height: MediaQuery.of(context).size.height,
                child: PdfView(
                  path: path,
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
}
