import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'add.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  //Explicit
  final textFill = GlobalKey<FormState>();
  String username, password;
  TextEditingController userCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void route(Widget routeName) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => routeName,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Form(
          key: textFill,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              usernameText(),
              SizedBox(
                height: 10.0,
              ),
              passwordText(),
              SizedBox(
                height: 20.0,
              ),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameText() {
    return Container(
      // width: 250.0,
      child: TextField(
        onChanged: (value) => username = value.trim(),
        controller: userCon,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,

          // border: OutlineInputBorder(
          //   // gapPadding: 1,
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(20.0),
          //   ),
          // ),
          labelText: 'E-mail',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      // width: 250.0,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        controller: passwordCon,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(30.0),
          //   ),
          // ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) {
      print('******************************');
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      firebaseAuth
          .signInWithEmailAndPassword(email: username, password: password)
          .then((response) {
        print('Authen Success');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Add());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((response) {
        String title = response.code;
        String message = response.message;
        myAlert(title, message);
      });
    });
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            // ignore: deprecated_member_use
            actions: <Widget>[FlatButton(onPressed: () {}, child: Text('ok'))],
          );
        });
  }

  Widget loginButton() {
    // ignore: deprecated_member_use
    return Container(
      child: RaisedButton(
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        // ignore: unnecessary_new
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        color: Colors.purple[900],
        child: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        onPressed: () {
          textFill.currentState.save();
          checkAuthen();
          print('Login');
          Fluttertoast.showToast(
            msg: "เข้าสู่ระบบสำเร็จ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.purple[100],
            textColor: Colors.black,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผู้ดูแลระบบ'),
        toolbarHeight: 40,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.purple[200],
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'images/admin.png',
                height: 200,
              ),
              SizedBox(
                height: 40,
              ),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
