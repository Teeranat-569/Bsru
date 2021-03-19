import 'package:flutter/material.dart';

class HistoryPag5 extends StatefulWidget {
  @override
  _HistoryPag5State createState() => _HistoryPag5State();
}

class _HistoryPag5State extends State<HistoryPag5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      // appBar: AppBar(
      //     toolbarHeight: 40,
      //     backgroundColor: Colors.purple,
      //     leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: Icon(Icons.arrow_back),
      //     ),
      //     title: Text('')),
      appBar: AppBar(
          backgroundColor: Colors.purple[50],
          title: Text("ทำเนียบผู้บริหาร",style: TextStyle(color: Colors.black),),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 40,
          elevation: 0.00,
          automaticallyImplyLeading: false,
        ),
      body: ListView(children: <Widget>[
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''เอ.ซี.คาร์เตอร์
พ.ศ.๒๔๓๙ – ๒๔๔๖
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''หลวงบำเหน็จวรญาณ
พ.ศ.๒๔๔๖ – ๒๔๔๗
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''ขุนวิเทศดรุณการ
พ.ศ.๒๔๔๘ – ๒๔๕๘
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''พระประมวลวิชาพูล
พ.ศ.๒๔๕๘ – ๒๔๗๐
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''พระปวโรฬาร
พ.ศ.๒๔๗๐ – ๒๔๗๒
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''พระยาวิเศษศุภวัตร์
พ.ศ.๒๔๗๓ – ๒๔๘๐
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''หลวงทรงวิทยาศาสตร์
พ.ศ.๒๔๘๑ – ๒๔๘๒
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''หลวงภารสาร
พ.ศ.๒๔๘๓ – ๒๔๙๑
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''นายจรูญ วงศ์สายัณห์
พ.ศ.๒๔๙๑ – ๒๔๙๙
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''หลวงบุญปาลิตวิชาสาสก์
พ.ศ.๒๔๙๙ – ๒๕๐๐
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''นายสวัสดิ์ สิงหพงษ์
พ.ศ.๒๕๐๐ – ๒๕๐๑
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''นายโชค สุคันธวณิช
พ.ศ.๒๕๐๑ – ๒๕๐๔
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''นายพร ทองพูนศักดิ์
พ.ศ.๒๕๐๔ – ๒๕๐๘
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''นายศิริ ศุขกิจ
พ.ศ.๒๕๐๘ – ๒๕๑๑
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''นายจรูญ มิลินทร์
พ.ศ.๒๕๑๑ – ๒๕๑๘
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''ม.ร.ว.ทวีโภค เกษมศรี
พ.ศ.๒๕๑๘ – ๒๕๒๑
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''นายบุญเลิศ ศรีหงส์
พ.ศ.๒๕๒๑ – ๒๕๒๘
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''รศ.สุรพันธ์ ยันต์ทอง
พ.ศ.๒๕๒๘ – ๒๕๓๒
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''รศ.ฉลอง ภิรมย์รัตน์
พ.ศ.๒๕๓๒ – ๒๕๓๖
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''รศ.สันต์ ธรรมบำรุง
พ.ศ.๒๕๓๖ – ๒๕๔๖
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''รศ.ดร.สุพล วุฒิเสน
พ.ศ.๒๕๔๖ – ๒๕๕๕
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''รศ.ดร.พลสิทธิ์ หนูชูชัย
พ.ศ.๒๕๕๕ – ๒๕๕๖
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            '''ผศ.ดร.ลินดา เกณฑ์มา
๒๙ ตุลาคม ๒๕๕๘ – ปัจจุบัน
''',
            style: TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
        ),
      ]),
    );
  }
}
