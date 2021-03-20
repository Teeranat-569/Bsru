import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Faculty1 extends StatefulWidget {
  @override
  _Faculty1State createState() => _Faculty1State();
}

class _Faculty1State extends State<Faculty1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple[50],
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //   backgroundColor: Colors.purple,
      // ),
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          "คณะ",
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 40,
        elevation: 0.00,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
                child: ListTile(
                  title: Column(
                    children: [
                      ft1(),
                      ft2(),
                      ft3(),
                      ft4(),
                      ft5(),
                      ft6(),
                      ft7(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container ft1() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: Text(
          "คณะวิทยาศาสตร์และเทคโนโลยี",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/sci.png'),
          ),
          ListTile(
            title: website('http://sci.bsru.ac.th/sciweb/'),
          ),
          ListTile(
            title: facebook(
                'https://www.facebook.com/BSRU.science', '@BSRU.science'),
          )
        ],
      ),
    );
  }

  Container ft2() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: Text(
          "คณะครุศาสตร์",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/teah.png'),
          ),
          ListTile(
            title: website('http://edu.bsru.ac.th/index.php/th/'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/BSRUFacultyOfEducation/',
                '@BSRUFacultyOfEducation'),
          )
        ],
      ),
    );
  }

  Container ft3() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: Text(
          "คณะวิทยาการจัดการ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/manage.png'),
          ),
          ListTile(
            title: website('http://ms.bsru.ac.th/new/'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/MsBSRU/', '@MsBSRU'),
          )
        ],
      ),
    );
  }

  Container ft4() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: Text(
          "คณะมนุษยศาสตร์และสังคมศาสตร์",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/human.png'),
          ),
          ListTile(
            title: website('http://husoc.bsru.ac.th/'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/hbsru',
                'คณะมนุษยศาสตร์ฯ \nมรภ.บ้านสมเด็จเจ้าพระยา'),
          )
        ],
      ),
    );
  }

  Container ft5() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: Text(
          "วิทยาลัยการดนตรี",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/song.jpg'),
          ),
          ListTile(
            title: website('http://music.bsru.ac.th/'),
          ),
          ListTile(
            title: facebook(
                'https://www.facebook.com/bsrumusic2558', '@bsrumusic2558'),
          )
        ],
      ),
    );
  }

  Container ft6() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: Text(
          "คณะวิศวกรรมศาสตร์และเทคโนโลยีอุตสาหกรรม",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/elec.jpg'),
          ),
          ListTile(
            title: website('http://eit.bsru.ac.th/index.php'),
          ),
          ListTile(
            title: facebook(
                'https://www.facebook.com/%E0%B8%84%E0%B8%93%E0%B8%B0%E0%B8%A7%E0%B8%B4%E0%B8%A8%E0%B8%A7%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%AD%E0%B8%B8%E0%B8%95%E0%B8%AA%E0%B8%B2%E0%B8%AB%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1-%E0%B8%A1%E0%B8%9A%E0%B8%AA-353516652041322/',
                'คณะวิศวกรรมศาสตร์และ\nเทคโนโลยีอุตสาหกรรม มบส.'),
          )
        ],
      ),
    );
  }

  Container ft7() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: Text(
          "บัณฑิตวิทยาลัย",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/gradbanner.gif'),
          ),
          ListTile(
            title: website('http://grad.bsru.ac.th/grad2019/\nindex.php'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/graduateschoolbsru',
                'บัณฑิตวิทยาลัย \nมหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา'),
          )
        ],
      ),
    );
  }

  Widget website(String url) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      //

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.public,
            size: 30,
          ),

          // Text('เว็บไซต์'),
          TextButton(
              onPressed: () async {
                // const url = 'http://aar.bsru.ac.th/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Couid not launch $url';
                }
              },
              child: Text(
                url,
                style: TextStyle(color: Colors.orange[700]),
              ))
        ],
      ),
    );
  }

  Widget facebook(String url, String nameFace) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.thumb_up_alt,
            size: 30,
          ),
          TextButton(
              onPressed: () async {
                // const url = 'https://www.facebook.com/AarBsru/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Couid not launch $url';
                }
              },
              child:
                  Text(nameFace, style: TextStyle(color: Colors.orange[700])))
        ],
      ),
    );
  }
}
