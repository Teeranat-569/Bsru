// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:map_view/location.dart';
// import 'package:map_view/map_options.dart';
// import 'package:map_view/toolbar_action.dart';
// import 'package:map_view/map_view.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getMarkerData();
    showMap();
  }

//   Future _addFavorite() async {
//   //1. Show the map
//   mapView.show(
//       new MapOptions(
//           showUserLocation: true,
//           title: "Choose a favorite",
//           initialCameraPosition: new CameraPosition(new Location(45.512287, -122.645913), 18.0)),
//       toolbarActions: <ToolbarAction>[new ToolbarAction("Close", 1)]);

//   //2. Listen for the onMapReady
//   var sub = MapView.onMapReady.listen((_) => _updateRestaurantsAroundUser());
//   compositeSubscription.add(sub);

//   //3. Listen for camera changed events
//   sub =
//       mapView.onCameraChanged.listen((cam) => _updateRestaurantsAroundUser());
//   compositeSubscription.add(sub);

//   //4. Listen for toolbar actions
//   sub = mapView.onToolbarAction.listen((id) {
//     if (id == 1) {
//       mapView.dismiss();
//     }
//   });
//   compositeSubscription.add(sub);
// }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId('ONE'),
            position: LatLng(13.731498139213253, 100.49099313835245),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'shop'))
      ].toSet();
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 40,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
              title: Text('แผนที่ มบส.')),
          body: GoogleMap(
            markers:
                // getMarker(),
                Set<Marker>.of(markers.values),
            // mapType: Maptype.normal,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(13.731498139213253, 100.49099313835245),
              zoom: 18.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          )),
    );
  }

  void initMarker(specify, specifyId, double hue) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(hue),
      markerId: markerId,
      position: LatLng(specify['shmap'].latitude, specify['shmap'].longitude),
      infoWindow: InfoWindow(title: 'Shop', snippet: specify['NameMap']),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    // ignore: deprecated_member_use
    await Firestore.instance
        .collection('showmap')
        .getDocuments()
        .then((myMockDoc) {
      // ignore: deprecated_member_use
      if (myMockDoc.documents.isNotEmpty) {
        // ignore: deprecated_member_use
        for (int i = 0; i < myMockDoc.documents.length; i++) {
          // ignore: deprecated_member_use
          if (i == 0) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 300);
          } else if (i == 1) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 52);
          } else if (i == 2) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 29);
          } else if (i == 3) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 200);
          } else if (i == 4) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 201);
          } else if (i == 5) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 289);
          } else if (i == 6) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 129);
          } else if (i == 7) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 68);
          } else if (i == 8) {
            initMarker(myMockDoc.docs[i], myMockDoc.docs[i].documentID, 69);
          } else if (i == 9) {
            initMarker(
                myMockDoc.documents[i], myMockDoc.documents[i].documentID, 48);
          } else if (i == 10) {
            initMarker(
                myMockDoc.documents[i], myMockDoc.documents[i].documentID, 72);
          } else if (i == 11) {
            initMarker(
                myMockDoc.documents[i], myMockDoc.documents[i].documentID, 31);
          } else if (i == 12) {
            initMarker(
                myMockDoc.documents[i], myMockDoc.documents[i].documentID, 325);
          } else if (i == 13) {
            initMarker(
                myMockDoc.documents[i], myMockDoc.documents[i].documentID, 278);
          } else if (i == 14) {
            initMarker(
                myMockDoc.documents[i], myMockDoc.documents[i].documentID, 189);
          }
// initMarker(myMockDoc.documents[i], myMockDoc.documents[i].documentID,52);

        }
      }
    });
  }

  Widget showMap() {
    double lat1 = 13.732272022207257;
    double lng1 = 100.49022211024408;
    LatLng latlng = LatLng(lat1, lng1);
    LatLng latlng1 = LatLng(13.731498139213253, 100.49099313835245);
    LatLng latlng2 = LatLng(13.731484420268307, 100.49095152552789);
    LatLng latlng3 = LatLng(13.731335613343251, 100.49124039383932);
    LatLng latlng4 = LatLng(13.73254431884466, 100.4900721533758);
    LatLng latlng5 = LatLng(13.731470013144326, 100.49105015928531);
    LatLng latlng6 = LatLng(13.731356957812826, 100.49100513477032);
    LatLng latlng7 = LatLng(13.731366892875288, 100.49099782475047);
    LatLng latlng8 = LatLng(13.731260052384544, 100.49111433001771);
    LatLng latlng9 = LatLng(13.732561704436474, 100.4900230782736);
    LatLng latlng10 = LatLng(13.73239920928086, 100.49035537454054);
    LatLng latlng11 = LatLng(13.732578819091657, 100.49043054278638);
    LatLng latlng12 = LatLng(13.733119679436543, 100.4899979214769);
    LatLng latlng13 = LatLng(13.73132836408529, 100.49099388254555);
    LatLng latlng14 = LatLng(13.731416003975921, 100.49114612608379);
    LatLng latlng15 = LatLng(13.732562997781594, 100.49047256027704);
    LatLng latlng16 = LatLng(13.731340638423305, 100.49116214169406);
    LatLng latlng17 = LatLng(13.731462758012922, 100.4908707181216);

    LatLng sci = LatLng(13.73260711989596, 100.49038988914585);
    LatLng edu = LatLng(13.732246752806391, 100.48742362602128);
    LatLng manage = LatLng(13.731145409294014, 100.49123272956987);
    LatLng human = LatLng(13.73167383161388, 100.48785268977943);
    LatLng music = LatLng(13.731908267902522, 100.48799929466742);
    LatLng eng = LatLng(13.731395575154007, 100.48825641708635);

    CameraPosition cameraPosition = CameraPosition(
      target: latlng,
      zoom: 18.0,
    );
    Marker lo1() {
      return Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(300),
        markerId: MarkerId("1"),
        position: latlng,
        onTap: () {},
      );
    }

    Marker lo2() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(200),
          markerId: MarkerId("2"),
          position: latlng1,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "สำนักงานอธิการบดี", snippet: 'อาคาร 6 ชั้นที่ 6'));
    }

    Marker lo3() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(100),
          markerId: MarkerId("3"),
          position: latlng2,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "กองบริหารงานบุคคล", snippet: 'อาคาร 6 ชั้นที่ 11'));
    }

    Marker lo4() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(150),
          markerId: MarkerId("4"),
          position: latlng3,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "กองกลาง", snippet: 'อาคาร 6 ชั้นที่ 5 และ ชั้นที่ 6'));
    }

    Marker lo5() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(50),
          markerId: MarkerId("5"),
          position: latlng4,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "กองอาคารสถานที่และสิ่งแวดล้อม",
              snippet: 'อาคาร 1 ชั้นที่ 1'));
    }

    Marker lo6() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(10),
          markerId: MarkerId("6"),
          position: latlng5,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "งานประกันคุณภาพการศึกษา", snippet: 'อาคาร 6 ชั้นที่ 11'));
    }

    Marker lo7() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(30),
          markerId: MarkerId("7"),
          position: latlng6,
          onTap: () {},
          infoWindow:
              InfoWindow(title: "กองคลัง", snippet: 'อาคาร 6 ชั้นที่ 1'));
    }

    Marker lo8() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(60),
          markerId: MarkerId("8"),
          position: latlng7,
          onTap: () {},
          infoWindow:
              InfoWindow(title: "งานพัสดุ", snippet: 'อาคาร 5 ชั้นที่ 1'));
    }

    Marker lo9() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(2),
          markerId: MarkerId("9"),
          position: latlng8,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "สำนักส่งเสริมวิชาการและงานทะเบียน",
              snippet: 'อาคาร 5 ชั้นที่ 1'));
    }

    Marker lo10() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(48),
          markerId: MarkerId("10"),
          position: latlng9,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "สำนักกิจการนักศึกษา", snippet: 'อาคาร 1 ชั้นที่ 2M'));
    }

    Marker lo11() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(77),
          markerId: MarkerId("11"),
          position: latlng10,
          onTap: () {},
          infoWindow: InfoWindow(title: "สำนักประชาสัมพันธ์และสารสนเทศ"));
    }

    Marker lo12() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(269),
          markerId: MarkerId("12"),
          position: latlng11,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "สำนักคอมพิวเตอร์", snippet: 'อาคาร 10 ชั้นที่ 8'));
    }

    Marker lo13() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(196),
          markerId: MarkerId("13"),
          position: latlng12,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "สำนักวิเทศสัมพันธ์และเครือข่ายอาเซียน",
              snippet: 'อาคาร 11 ชั้นที่ 3'));
    }

    Marker lo14() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(230),
          markerId: MarkerId("14"),
          position: latlng13,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "สำนักงานสภามหาวิทยาลัย", snippet: 'อาคาร 6 ชั้นที่ 14'));
    }

    Marker lo15() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(359),
          markerId: MarkerId("15"),
          position: latlng14,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "สถาบันวิจัยและพัฒนา", snippet: 'อาคาร 6 ชั้นที่ 7'));
    }

    Marker lo16() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(110),
          markerId: MarkerId("16"),
          position: latlng15,
          onTap: () {},
          infoWindow: InfoWindow(title: "สถาบันขงจื้อ"));
    }

    Marker lo17() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(46),
          markerId: MarkerId("17"),
          position: latlng16,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "หน่วยตรวจสอบภายใน", snippet: 'อาคาร 6 ชั้นที่ 11'));
    }

    Marker lo18() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(297),
          markerId: MarkerId("18"),
          position: latlng17,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "กองนโยบายและแผน", snippet: 'อาคาร 6 ชั้นที่ 7'));
    }

    Marker lo19() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(297),
          markerId: MarkerId("19"),
          position: sci,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "คณะวิทยาศาสตร์และเทคโนโลยี", snippet: 'อาคาร 9'));
    }

    Marker lo20() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(297),
          markerId: MarkerId("20"),
          position: edu,
          onTap: () {},
          infoWindow: InfoWindow(title: "คณะครุศาสตร์", snippet: 'อาคาร 30'));
    }

    Marker lo21() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(297),
          markerId: MarkerId("21"),
          position: manage,
          onTap: () {},
          infoWindow:
              InfoWindow(title: "คณะวิทยาการจัดการ", snippet: 'อาคาร 7'));
    }

    Marker lo22() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(297),
          markerId: MarkerId("22"),
          position: human,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "คณะมนุษยศาสตร์และสังคมศาสตร์", snippet: 'อาคาร 27'));
    }

    Marker lo23() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(297),
          markerId: MarkerId("23"),
          position: music,
          onTap: () {},
          infoWindow:
              InfoWindow(title: "วิทยาลัยการดนตรี", snippet: 'อาคาร 27'));
    }

    Marker lo24() {
      return Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(29),
          markerId: MarkerId("24"),
          position: eng,
          onTap: () {},
          infoWindow: InfoWindow(
              title: "คณะวิศวกรรมศาสตร์และเทคโนโลยีอุตสาหกรรม",
              snippet: 'อาคาร 24 ชั้นที่ M'));
    }

    Set<Marker> myset() {
      return <Marker>[
        lo1(),
        lo2(),
        lo3(),
        lo4(),
        lo5(),
        lo6(),
        lo7(),
        lo8(),
        lo9(),
        lo10(),
        lo11(),
        lo12(),
        lo13(),
        lo14(),
        lo15(),
        lo16(),
        lo17(),
        lo18(),
        lo19(),
        lo20(),
        lo21(),
        lo22(),
        lo23(),
        lo24(),
      ].toSet();
    }

    return Container(
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myset(),
      ),
    );
  }
}
