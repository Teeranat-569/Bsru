import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgencyFour extends StatefulWidget {
  @override
  _AgencyFourState createState() => _AgencyFourState();
}

class _AgencyFourState extends State<AgencyFour> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //   backgroundColor: Colors.purple,
      //   // title: Text(''),
      //   leading: IconButton(
      //       icon: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       }),
      // )
       appBar: AppBar(
          backgroundColor: Colors.purple[100],
          // title: Text("กองอาคารสถานที่และสิ่งแวดล้อม",style: TextStyle(color: Colors.black),),
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
            Container(
                child: Column(
              children: [website(), phone(), facebook()],
            )),
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),

      // color: Colors.green,
      child: Image.asset('images/nn.png'),
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
                    const url = 'http://building.bsru.ac.th/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text('http://building.bsru.ac.th/'))
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.smartphone,
                size: 40,
              ),
              Text(
                '0-2473-7000 ',
                style: TextStyle(color: Colors.blue,fontSize: 22),
              ),
              Text('ต่อ 1113 , 1114'),
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
                  })
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
                Icons.facebook,
                size: 40,
              ),
              TextButton(
                  onPressed: () async {
                    const url = 'https://www.facebook.com/bsrubuilding';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text('https://www.facebook.com/bsrubuilding'))
            ],
          ),
        ));
  }
}
