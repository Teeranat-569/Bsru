import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
            title: Text('ติดต่อ มบส.')),
        body: Container(
          color: Colors.purple[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  contact(),
                  contact2(),
                  SizedBox(height: 20),
                  showMap()
                ],
              ),
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
          style: TextStyle(color: Colors.blue, fontSize: 22),
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

  Widget showMap() {
    LatLng latlng = LatLng(13.732272022207257, 100.49022211024408);
    CameraPosition cameraPosition = CameraPosition(
      target: latlng,
      zoom: 20.0,
    );
    return Container(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: {
          Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(300),
            markerId: MarkerId("1"),
            position: latlng,
            onTap: () {},
            infoWindow: InfoWindow(title: 'll'),
          ),
        },
      ),
    );
  }
}
