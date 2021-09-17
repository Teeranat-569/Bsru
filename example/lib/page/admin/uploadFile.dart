// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Upload extends StatefulWidget {
//   @override
//   _UploadState createState() => _UploadState();
// }

// class _UploadState extends State<Upload> {
//   String linkForm;
//   TextEditingController textEditingController = TextEditingController();
//   CollectionReference _fireStore = FirebaseFirestore.instance.collection('linkmanual');
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios),
//           onPressed: (){
//             Navigator.of(context).pop();
//           },),title: Text('แก้ไขคู่มือนักศึกษา'),),
//       body: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//         children: [linkform(), uploadButton()],
//       ),
//           )),
//     ));
//   }

//   void addUser() {
//     _fireStore.add({
//       'link': linkForm,
//       // 'indexid' : index,
//     }).then((document) {
//       // prints the document id when data adding succeed.
//       debugPrint('+++++++++++++++++++++++++++++++++++'+ document.id);
//     });
//   }

//   Widget linkform() {
//     return TextField(
//       onChanged: (value) => linkForm = value.trim(),
//       controller: textEditingController,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//         labelText: 'ระบุ link คู่มือนักศึกษา',
//         labelStyle: TextStyle(
//           fontSize: 16.0,
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget uploadButton() {
//     return RaisedButton(
//       onPressed: () {
//         addUser();
//       },
//       child: Text('อัพโหลด link'),
//     );
//   }


// }
