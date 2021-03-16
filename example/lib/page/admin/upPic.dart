import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpPic extends StatefulWidget {
  @override
  _UpPicState createState() => _UpPicState();
}

class _UpPicState extends State<UpPic> {
  File file;
  String urlPIC;
  String pic;
  CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('UpPIC');
  List widgets = [];

   @override
  void initState() {
    super.initState();
    // readAlldata3();
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Container(
                //   width: 100,
                //   height: 100,
                // ),
                Container(
                  color: Colors.black,
                  child: showImage(),
                ),
                RaisedButton(
                  onPressed: () {
                    //  _imgFromGallery();
                    chooseImage(ImageSource.gallery);
                  },
                  child: Icon(Icons.add_photo_alternate_outlined),
                ),
                RaisedButton(
                  onPressed: () {
                    //  _imgFromGallery();
                    // chooseImage(ImageSource.gallery);
                    uploadPICtoStorage();
                    
                  },
                  child: Icon(Icons.add_photo_alternate_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> readAlldata3() async {
  //   await Firebase.initializeApp().then((value) async {
  //     print('success');
  //     // ignore: await_only_futures
  //     await FirebaseFirestore.instance
  //         .collection('UpPIC')
  //         .snapshots()
  //         .listen((event) {
  //       print('snapshot = ${event.docs}');
  //       for (var snapshots in event.docs) {
  //         Map<String, dynamic> map = snapshots.data();
  //         print('Map == $map');
  //        PicModel model2 = PicModel.fromMap(map);

  //         setState(() {
  //           // widgets.add(model2);
  //           pic = model2.pic;
  //           print('33333333333333333333333333333333333333333333333333333333$pic');
            
  //         });
  //       }
  //     });
  //   });
  // }

  

  void addUser() {
    // _fireStore.add({
    //   'pic': urlPIC,

    //   // 'indexid' : index,
    // }).then((document) {
    //   // prints the document id when data adding succeed.
    //   debugPrint('+++++++++++++++++++++++++++++++++++' + document.id);
    // });

    //   await reference.updateData({
    // 'price' : 200
// });
    _fireStore
        .document('bSozj1LRLY9omyIyXEXZ')
        .updateData({"pic": urlPIC}).then((result) {
      print("--------------------------------------new USer true");
    }).catchError((onError) {
      print("onError");
    });
  }

  Future<void> uploadPICtoStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('pic/pic$i.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(file);
    urlPIC = await (await storageUploadTask.onComplete).ref.getDownloadURL();
    print('**********************************************$urlPIC');
    addUser();
    // setState(() {
    //   // file = image;
    // });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      file = image;
    });
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    try {
      // ignore: deprecated_member_use
      var object = await ImagePicker.pickImage(
        source: imageSource,
        maxHeight: 800.0,
        maxWidth: 800.0,
      );
      setState(() {
        file = object;
      });
    } catch (e) {}
  }

  Widget showImage() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        width: 355.0,
        height: 300.0,
        child: file == null 
            ? Center(child: Text('ไม่ได้อัพโหลดรูปภาพ'))
            : ClipRect(
                child:
                    InteractiveViewer(maxScale: 20, child: Image.file(file))));
  }
}
