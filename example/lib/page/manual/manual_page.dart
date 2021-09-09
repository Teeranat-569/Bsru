import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_example/page/manual/fdf_manual.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fdf.dart';
import 'form.dart';
import 'form2.dart';
import 'link_model.dart';

class ManualPage extends StatefulWidget {
  @override
  _ManualPageState createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  String link, nameManual;
  List<dynamic> widgets = [];

  @override
  void initState() {
    super.initState();
    readAlldata3();
  }

  Future<void> readAlldata3() async {
    await Firebase.initializeApp().then((value) async {
      print('success');
      await FirebaseFirestore.instance
          .collection('linkmanual')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('Map == $map');
          LinkModel model = LinkModel.fromMap(map);

          setState(() {
            widgets.add(model);
            link = model.link;
            nameManual = model.nameManual;
          });
        }
      });
    });
  }

  Widget showGrid() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      childAspectRatio: 16 / 3,
      children: <Widget>[
        button1(),
        button2(),
      ],
    );
  }

  // ignore: deprecated_member_use
  RaisedButton

      // ignore: non_constant_identifier_names
      button1() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          // route(MyApp3());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                '${nameManual}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  RaisedButton
      // ignore: non_constant_identifier_names
      button2() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          // route(MyApp());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'คู่มือเส้นทางสู่บัณฑิต 2562 - 2563',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  Widget showListdata() {
    return RefreshIndicator(
      onRefresh: readAlldata3,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 12),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.shade200,
              ),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                  onPressed: () {
                    route(Fdf_manual(), widgets[index]);
                  },
                  padding: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '${widgets[index].nameManual}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
          );
        },
      ),
    );
  }

  Future<Null> route(Widget routeName, LinkModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('link', model.link);
    await preferences.setString('nameManual', model.nameManual);

    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[50],
          toolbarHeight: 40,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
          ),
          title: Text(
            'คู่มือนักศึกษา',
            style: TextStyle(color: Colors.purple),
          )),
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.purple[50],
          child: showListdata()),
    );
  }
}
