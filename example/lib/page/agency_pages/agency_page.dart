
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/faculty/faculty_1.dart';

import 'agency_page_contact.dart';

class AgencyPage extends StatefulWidget {
  @override
  _AgencyPageState createState() => _AgencyPageState();
}

class _AgencyPageState extends State<AgencyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.purple,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text('หน่วยงาน')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.purple[100],
          child: Column(
            children: [
              agencyButton(),
              facultyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget agencyButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.account_balance),
                    iconSize: 100,
                    onPressed: () {
                      route(AgencyPageContact());
                    },
                  ),
                  Text(
                    'หน่วยงาน',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget facultyButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.collections_bookmark),
                    iconSize: 100,
                    onPressed: () {
                      route(Faculty1());
                    },
                  ),
                  Text(
                    'คณะ',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }
}
