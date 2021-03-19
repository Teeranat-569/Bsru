import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  double lat, lng;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.purple[50],
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,color: Colors.purple,),
            ),
            title: Text('ติดต่อ มบส.',style: TextStyle(color: Colors.purple),)),
        body: Container(
          color: Colors.purple[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  contact(),
                  contact2(),
                  SizedBox(height: 20.0.h),
                  // showMap()
                  showmapButton()
                ],
              ),
            ),
          ),
        ),
      
    );
  }

  Widget contact() {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 80,
          backgroundImage: AssetImage('images/hhoo.jpg'),
        )
      ],
    );
  }

  Widget contact2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '0-2473-7000 ',
          style: TextStyle(color: Colors.blue, fontSize: 22.0.sp),
        ),
        IconButton(
            icon: Icon(
              Icons.local_phone,
              color: Colors.green,
              size: 50,
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
    );
  }

   Future _launchURLMAp() async {
    const url = 'https://maps.app.goo.gl/DKoiVgDkk7bYTJSY7';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget showmapButton() {
    return RaisedButton(
      color: Colors.cyan,
      onPressed: () {

        _launchURLMAp();
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.map_outlined,
            color: Colors.white,
            size: 50,
          ),
          Text('แผนที่มหาวิทยาลัย',style: TextStyle(color: Colors.white,fontSize: 25),),
        ],
      ),
    );
  }
}
