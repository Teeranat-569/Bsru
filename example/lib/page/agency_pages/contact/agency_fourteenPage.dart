import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgencyFourteen extends StatefulWidget {
  @override
  _AgencyFourteenState createState() => _AgencyFourteenState();
}

class _AgencyFourteenState extends State<AgencyFourteen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //   backgroundColor: Colors.purple,
      //   // title: Text('',style: TextStyle(fontSize: 14),),
      //   leading: IconButton(
      //       icon: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       }),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        // title: Text("สำนักงานวิทยบริการและเทคโนโลยีสารสนเทศ",style: TextStyle(color: Colors.black),),
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
      child: Image.asset('images/ej.jpg'),
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
                    const url = 'http://arcbs.bsru.ac.th/web2009/index.html';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text(
                    'http://arcbs.bsru.ac.th/web2009/index.html',
                    style: TextStyle(fontSize: 12),
                  ))
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
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              Text('ต่อ 1700-1707 \nกด 100'),
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
                    const url = 'https://www.facebook.com/library.bansomdej';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Couid not launch $url';
                    }
                  },
                  child: Text('https://www.facebook.com/\nlibrary.bansomdej'))
            ],
          ),
        ));
  }
}
