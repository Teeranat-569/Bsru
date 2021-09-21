import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ExManual extends StatefulWidget {
  String nameFormm;
  ExManual({Key key, this.nameFormm}) : super(key: key);
  @override
  _ExManualState createState() => _ExManualState();
}

class _ExManualState extends State<ExManual> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('ตัวอย่างคู่มือ'),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.deepOrange,
              child: SfPdfViewer.network('${widget.nameFormm}'))),
    );
  }
}
