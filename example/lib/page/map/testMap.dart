import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map1 extends StatefulWidget {
  @override
  _Map1State createState() => _Map1State();
  
}

class _Map1State extends State<Map1> {
 LatLng latLng;
  String nameShop;

 @override
  void initState() {
    super.initState();
    getData();
    // print(widget.showlistmap);
  }

   Future<void> getData() async {
    //   ignore: deprecated_member_use
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // ignore: unused_local_variable
    final collectionReference = await firestore
        .collection("showmap")
        .doc()
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        GeoPoint pos = data['shmap'];
        setState(() {
          // nameShop = data['Namemap'];
          print('***************************************************************$nameShop');
          latLng = LatLng(pos.latitude, pos.longitude);
          print('///////////////////////////////////////////////////////////////$latLng');
        });
      }
    });
  }

  Container showmap(LatLng latLng, String nameShop) {
  CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16.0);
  return Container(
    height: 300,
    child: GoogleMap(
      markers: {
        Marker(
            markerId: MarkerId("1"),
            position: latLng,
            onTap: () {},
            infoWindow: InfoWindow(title: nameShop))
      },
      initialCameraPosition: cameraPosition,
      mapType: MapType.normal,
      onMapCreated: (controller) {},
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child: Scaffold(body:  Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: latLng == null
                                  ? CircularProgressIndicator()
                                  : showmap(latLng, nameShop),
                            ),
                          ],
                        ),
                      ),),
      
    );
  }
}