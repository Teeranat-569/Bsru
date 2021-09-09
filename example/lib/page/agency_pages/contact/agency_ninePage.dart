import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgencyNine extends StatefulWidget {
  @override
  _AgencyNineState createState() => _AgencyNineState();
}

class _AgencyNineState extends State<AgencyNine> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //   backgroundColor: Colors.purple,
      //   // title: Text('',style: TextStyle(fontSize: 16),),
      //   leading: IconButton(
      //       icon: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       }),
      // )
       appBar: AppBar(
          backgroundColor: Colors.purple[100],
          // title: Text("สำนักส่งเสริมวิชาการและงานทะเบียน",style: TextStyle(color: Colors.black),),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 40,
          elevation: 0.00,
          automaticallyImplyLeading: false,
        ),
      body: Container(
        color: Colors.purple[100],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            showImage(),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    child: Column(
                  children: [website(), phone(), facebook()],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Image.asset('images/web.png'),
    );
  }

  Widget showGrid() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      childAspectRatio: 16 / 3,
      children: <Widget>[website()],
    );
  }

  Widget website() {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.public,
                size: 40,
              ),
              TextButton(
                  onPressed: () async {
                    const url = 'http://aar.bsru.ac.th/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text('http://aar.bsru.ac.th/'))
            ],
          ),
        ));
  }

  Widget phone() {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.smartphone,
                size: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '0-2473-7000 ',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.local_phone,
                            color: Colors.green,
                          ),
                          onPressed: () async {
                            const url = 'tel:0-2473-7000';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Couid not launch $url';
                            }
                          }),
                    ],
                  ),
                  Text('กลุ่มงานบริหารงานทั่วไป (งานธุรการ) ต่อ 1710'),
                  Text('หัวหน้าสำนักงานและรองผู้อำนวยการสำนัก ต่อ 1711'),
                  Text('ผู้อำนวยการสำนัก ต่อ 1713'),
                  Text('งานกำหนดตำแหน่งทางวิชาการ ต่อ 1105'),
                  Text('กลุ่มงานบริหารงานทั่วไป ต่อ 1714'),
                  Text(
                      'กลุ่มงานบริหารงานทั่วไป (เคาน์เตอร์ : คำร้องทั่วไป)\nต่อ 1715'),
                  Text(
                      'กลุ่มงานไอที \n(ลงทะเบียนเรียน ปลดล็อก รีเซ็ตรหัสผ่าน)\nต่อ 1717'),
                  Text(
                      'กลุ่มงานทะเบียนเรียนและประมวลผลการศึกษา\n(วัดผลสำเร็จการศึกษา) ต่อ 1718'),
                  Text(
                      'กลุ่มงานทะเบียนประวัติและออกเอกสาร\nทางการศึกษา (เอกสารสำคัญ) ต่อ 1719'),
                  Text(
                      'ศูนย์รับนิสิตสายตรง (รับสมัครนิสิตนักศึกษาใหม่)\nต่อ 1716 / 1998 '),
                ],
              ),
            ],
          ),
        ));
  }

  Widget facebook() {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.facebook,
                size: 40,
              ),
              TextButton(
                  onPressed: () async {
                    const url = 'https://www.facebook.com/AarBsru/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text('https://www.facebook.com/AarBsru/'))
            ],
          ),
        ));
  }
}
