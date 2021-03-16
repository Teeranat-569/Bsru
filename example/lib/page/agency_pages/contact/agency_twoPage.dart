import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgencyTwo extends StatefulWidget {
  @override
  _AgencyTwoState createState() => _AgencyTwoState();
}

class _AgencyTwoState extends State<AgencyTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.purple,
        // title: Text('สำนักงานอธิการบดี'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
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
            Container(
                child: Column(
              children: [website(), phone(), facebook()],
            )),
          ],
        ),
      ),
    ));
  }

  Widget showImage() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),

      // color: Colors.green,
      child: Image.asset('images/cropped-banner.hrmd_.jpg'),
    );
  }

  Widget website() {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        //
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.public,
                size: 40,
              ),

              // Text('เว็บไซต์'),
              TextButton(
                  onPressed: () async {
                    const url = 'http://hrmd.bsru.ac.th/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text('http://hrmd.bsru.ac.th/'))
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
        //
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.smartphone,
                size: 40,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '0-2473-7000 ',
                        style: TextStyle(color: Colors.blue,fontSize: 22),
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
                  Text('งานบริหารทั่วไป ต่อ 1111'),
                  Text('งานสรรหา บรรจุ แต่งตั้ง ฯ ต่อ 1112 และ 1104'),
                  Text('งานพัฒนาระบบงานอัตรากำลังฯ ต่อ 1105'),
                  Text('งานกำหนดตำแหน่งทางวิชาการ ต่อ 1105'),
                  Text('งานวินัยและนิติการ ต่อ 1992'),
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
        //
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.thumb_up_alt,
                size: 40,
              ),
              TextButton(
                  onPressed: () async {
                    const url = 'https://www.facebook.com/HRmd.BSRU';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text('https://www.facebook.com/HRmd.BSRU'))
            ],
          ),
        ));
  }
}
