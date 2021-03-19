import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'student_new.dart';
import 'student_old.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0.0,
          backgroundColor: Colors.purple[100],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,color: Colors.purple,),
          ),
          title: Text(
            'นักศึกษา',
            style: TextStyle(color: Colors.purple),
          )),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.purple[500]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                    children: <Widget>[],
                    width: 150,
                    height: 160,
                    pressedImage: Image.asset(
                      'images/employee.png',
                    ),
                    unpressedImage: Image.asset(
                      'images/employeeii.png',
                    ),
                    onTap: () {
                      print('test');
                      route(Studentnew());
                    },
                  ),
                  Text(
                    'นักศึกษาใหม่',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.purple[500]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                    children: <Widget>[],
                    width: 150,
                    height: 160,
                    pressedImage: Image.asset(
                      'images/employee.png',
                    ),
                    unpressedImage: Image.asset(
                      'images/employee.png',
                    ),
                    onTap: () {
                      print('test');
                      route(Studentold());
                    },
                  ),
                  Text(
                    'นักศึกษาปัจจุบัน',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
