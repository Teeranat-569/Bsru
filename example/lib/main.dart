// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import 'home.dart';
import 'splash_screen.dart';

void main() {
  Intl.defaultLocale = "th";
  initializeDateFormatting();
  PdfView.platform = SurfaceAndroidPdfViewer();
  GoogleMap.init('AIzaSyA0yrWU1w1pT0jkQ-nHKZL5qL3j-TZpLj0');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Google Map Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: MyHomePage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashScreen(),
        '/home': (BuildContext context) => Home(),
      },
      theme: ThemeData(fontFamily: 'Pridi', primarySwatch: Colors.purple),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _key = GlobalKey<GoogleMapStateBase>();
  bool _polygonAdded = false;
  bool _darkMapStyle = false;
  String _mapStyle;

  List<Widget> _buildClearButtons() => [
        RaisedButton.icon(
          color: Colors.red,
          textColor: Colors.white,
          icon: Icon(Icons.bubble_chart),
          label: Text('CLEAR POLYGONS'),
          onPressed: () {
            GoogleMap.of(_key).clearPolygons();
            setState(() => _polygonAdded = false);
          },
        ),
        const SizedBox(width: 16),
        RaisedButton.icon(
          color: Colors.red,
          textColor: Colors.white,
          icon: Icon(Icons.pin_drop),
          label: Text('CLEAR MARKERS'),
          onPressed: () {
            GoogleMap.of(_key).clearMarkers();
          },
        ),
        const SizedBox(width: 16),
        RaisedButton.icon(
          color: Colors.red,
          textColor: Colors.white,
          icon: Icon(Icons.directions),
          label: Text('CLEAR DIRECTIONS'),
          onPressed: () {
            GoogleMap.of(_key).clearDirections();
          },
        ),
      ];

  List<Widget> _buildAddButtons() => [
        FloatingActionButton(
          child: Icon(_polygonAdded ? Icons.edit : Icons.bubble_chart),
          backgroundColor: _polygonAdded ? Colors.orange : null,
          onPressed: () {
            if (!_polygonAdded) {
              GoogleMap.of(_key).addPolygon(
                '1',
                polygon,
                onTap: (polygonId) async {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(
                        'This dialog was opened by tapping on the polygon!\n'
                        'Polygon ID is $polygonId',
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: Navigator.of(context).pop,
                          child: Text('CLOSE'),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              GoogleMap.of(_key).editPolygon(
                '1',
                polygon,
                fillColor: Colors.purple,
                strokeColor: Colors.purple,
              );
            }

            setState(() => _polygonAdded = true);
          },
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          child: Icon(Icons.pin_drop),
          onPressed: () {
            GoogleMap.of(_key).addMarkerRaw(
              GeoCoord(33.875513, -117.550257),
              info: 'test info',
              onInfoWindowTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(
                        'This dialog was opened by tapping on the InfoWindow!'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text('CLOSE'),
                      ),
                    ],
                  ),
                );
              },
            );
            GoogleMap.of(_key).addMarkerRaw(
              GeoCoord(33.775513, -117.450257),
              icon: 'assets/images/map-marker-warehouse.png',
              info: contentString,
            );
          },
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          child: Icon(Icons.directions),
          onPressed: () {
            GoogleMap.of(_key).addDirection(
              'San Francisco, CA',
              'San Jose, CA',
              startLabel: '1',
              startInfo: 'San Francisco, CA',
              endIcon: 'assets/images/map-marker-warehouse.png',
              endInfo: 'San Jose, CA',
            );
          },
        ),
      ];

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.purple[50],
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.purple,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            'แผนที่ มบส.',
            style: TextStyle(color: Colors.purple),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: GoogleMap(
                key: _key,
                markers: {
                  Marker(
                    GeoCoord(13.73242603347886, 100.4903190549412),
                    info: 'มหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา',
                  ),
                  Marker(
                    GeoCoord(
                      13.731498139213253,
                      100.49099313835245,
                    ),
                    // icon: 'images/pin.png',
                    info: 'สำนักงานอธิการบดี', infoSnippet: 'อาคาร 6 ชั้นที่ 6',
                    // icon: BitmapDescriptor.defaultMarker
                  ),
                  Marker(GeoCoord(13.731484420268307, 100.49095152552789),
                      info: 'กองบริหารงานบุคคล',
                      infoSnippet: 'อาคาร 6 ชั้นที่ 11'),
                  Marker(GeoCoord(13.731335613343251, 100.49124039383932),
                      info: 'กองกลาง',
                      infoSnippet: 'อาคาร 6 ชั้นที่ 5 และ ชั้นที่ 6'),
                  Marker(GeoCoord(13.73254431884466, 100.4900721533758),
                      info: 'กองอาคารสถานที่และสิ่งแวดล้อม',
                      infoSnippet: 'อาคาร 1 ชั้นที่ 1'),
                  Marker(GeoCoord(13.731470013144326, 100.49105015928531),
                      info: 'งานประกันคุณภาพการศึกษา',
                      infoSnippet: 'อาคาร 6 ชั้นที่ 11'),
                  Marker(GeoCoord(13.731356957812826, 100.49100513477032),
                      info: 'กองคลัง', infoSnippet: 'อาคาร 6 ชั้นที่ 1'),
                  Marker(GeoCoord(13.731787576953424, 100.49044080449569),
                      info: 'งานพัสดุ', infoSnippet: 'อาคาร 5 ชั้นที่ 1'),
                  Marker(GeoCoord(13.731754712047824, 100.49046787001602),
                      info: 'สำนักส่งเสริมวิชาการและงานทะเบียน',
                      infoSnippet: 'อาคาร 5 ชั้นที่ 1'),
                  Marker(GeoCoord(13.732561704436474, 100.4900230782736),
                      info: 'สำนักกิจการนักศึกษา',
                      infoSnippet: 'อาคาร 1 ชั้นที่ 2M'),
                  Marker(
                    GeoCoord(13.73239920928086, 100.49035537454054),
                    info: 'สำนักประชาสัมพันธ์และสารสนเทศ',
                    // infoSnippet: 'อาคาร 6 ชั้นที่ 6'
                  ),
                  Marker(GeoCoord(13.732582375345622, 100.49046657916095),
                      info: 'สำนักคอมพิวเตอร์',
                      infoSnippet: 'อาคาร 10 ชั้นที่ 8'),
                  Marker(GeoCoord(13.733119679436543, 100.4899979214769),
                      info: 'สำนักวิเทศสัมพันธ์และเครือข่ายอาเซียน',
                      infoSnippet: 'อาคาร 11 ชั้นที่ 3'),
                  Marker(GeoCoord(13.73132836408529, 100.49099388254555),
                      info: 'สำนักงานสภามหาวิทยาลัย',
                      infoSnippet: 'อาคาร 6 ชั้นที่ 14'),
                  Marker(GeoCoord(13.731416003975921, 100.49114612608379),
                      info: 'สถาบันวิจัยและพัฒนา',
                      infoSnippet: 'อาคาร 6 ชั้นที่ 7'),
                  Marker(GeoCoord(13.732693110603252, 100.49038074847702),
                      info: 'สถาบันขงจื้อ', infoSnippet: 'อาคาร 10 ชั้นที่ 7'),
                  Marker(GeoCoord(13.731340638423305, 100.49116214169406),
                      info: 'หน่วยตรวจสอบภายใน',
                      infoSnippet: 'อาคาร 6 ชั้นที่ 11'),
                  Marker(GeoCoord(13.731462758012922, 100.4908707181216),
                      info: 'กองนโยบายและแผน',
                      infoSnippet: 'อาคาร 6 ชั้นที่ 7'),
                },
                initialZoom: 18,
                initialPosition: GeoCoord(
                    13.73242603347886, 100.4903190549412), // Los Angeles, CA
                mapType: MapType.roadmap,
                mapStyle: _mapStyle,
                interactive: true,
                // onTap: (coord) =>
                //     _scaffoldKey.currentState.showSnackBar(SnackBar(
                //   content: Text(coord?.toString()),
                //   duration: const Duration(seconds: 2),
                // )),
                mobilePreferences: const MobileMapPreferences(
                  trafficEnabled: true,
                  zoomControlsEnabled: false,
                ),
                webPreferences: WebMapPreferences(
                  fullscreenControl: true,
                  zoomControl: true,
                ),
              ),
            ),
            // Positioned(
            //   top: 16,
            //   left: 16,
            //   child: FloatingActionButton(
            //     child: Icon(Icons.person_pin_circle),
            //     onPressed: () {
            //       final bounds = GeoCoordBounds(
            //         northeast: GeoCoord(13.73242603347886, 100.4903190549412),
            //         southwest: GeoCoord(13.73242603347886, 100.4903190549412),
            //       );
            //       GoogleMap.of(_key).moveCameraBounds(bounds);
            //       GoogleMap.of(_key).addMarkerRaw(
            //         GeoCoord(
            //           (bounds.northeast.latitude + bounds.southwest.latitude) /
            //               2,
            //           (bounds.northeast.longitude +
            //                   bounds.southwest.longitude) /
            //               2,
            //         ),
            //         onTap: (markerId) async {
            //           await showDialog(
            //             context: context,
            //             builder: (context) => AlertDialog(
            //               content: Text(
            //                 'This dialog was opened by tapping on the marker!\n'
            //                 'Marker ID is $markerId',
            //               ),
            //               actions: <Widget>[
            //                 FlatButton(
            //                   onPressed: Navigator.of(context).pop,
            //                   child: Text('CLOSE'),
            //                 ),
            //               ],
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            // Positioned(
            //   top: 16,
            //   right: kIsWeb ? 60 : 16,
            //   child: FloatingActionButton(
            //     onPressed: () {
            //       if (_darkMapStyle) {
            //         GoogleMap.of(_key).changeMapStyle(null);
            //         _mapStyle = null;
            //       } else {
            //         GoogleMap.of(_key).changeMapStyle(darkMapStyle);
            //         _mapStyle = darkMapStyle;
            //       }

            //       setState(() => _darkMapStyle = !_darkMapStyle);
            //     },
            //     backgroundColor: _darkMapStyle ? Colors.black : Colors.white,
            //     child: Icon(
            //       _darkMapStyle ? Icons.wb_sunny : Icons.brightness_3,
            //       color: _darkMapStyle ? Colors.white : Colors.black,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   left: 16,
            //   right: kIsWeb ? 0 : 0,
            //   bottom: 16,
            //   child: Row(
            //     children: <Widget>[
            //       LayoutBuilder(
            //         builder: (context, constraints) =>
            //             constraints.maxWidth < 1000
            //                 ? Row(children: _buildClearButtons())
            //                 : Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: _buildClearButtons(),
            //                   ),
            //       ),
            //       Spacer(),
            //       ..._buildAddButtons(),
            //     ],
            //   ),
            // ),
          ],
        ),
      );
}

const darkMapStyle = r'''
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]
''';

const contentString = r'''
<div id="content">
  <div id="siteNotice"></div>
  <h1 id="firstHeading" class="firstHeading">Uluru</h1>
  <div id="bodyContent">
    <p>
      <b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large 
      sandstone rock formation in the southern part of the 
      Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) 
      south west of the nearest large town, Alice Springs; 450&#160;km 
      (280&#160;mi) by road. Kata Tjuta and Uluru are the two major 
      features of the Uluru - Kata Tjuta National Park. Uluru is 
      sacred to the Pitjantjatjara and Yankunytjatjara, the 
      Aboriginal people of the area. It has many springs, waterholes, 
      rock caves and ancient paintings. Uluru is listed as a World 
      Heritage Site.
    </p>
    <p>
      Attribution: Uluru, 
      <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">
        http://en.wikipedia.org/w/index.php?title=Uluru
      </a>
      (last visited June 22, 2009).
    </p>
  </div>
</div>
''';

const polygon = <GeoCoord>[
  GeoCoord(32.707868, -117.191018),
  GeoCoord(32.705645, -117.191096),
  GeoCoord(32.697756, -117.166664),
  GeoCoord(32.686486, -117.163206),
  GeoCoord(32.675876, -117.169452),
  GeoCoord(32.674726, -117.165233),
  GeoCoord(32.679833, -117.158487),
  GeoCoord(32.677571, -117.153893),
  GeoCoord(32.671987, -117.160079),
  GeoCoord(32.667547, -117.160477),
  GeoCoord(32.654748, -117.147579),
  GeoCoord(32.651933, -117.150312),
  GeoCoord(32.649676, -117.144334),
  GeoCoord(32.631665, -117.138201),
  GeoCoord(32.632033, -117.132249),
  GeoCoord(32.630156, -117.137234),
  GeoCoord(32.628072, -117.136479),
  GeoCoord(32.630315, -117.131443),
  GeoCoord(32.625930, -117.135312),
  GeoCoord(32.623754, -117.131664),
  GeoCoord(32.627465, -117.130883),
  GeoCoord(32.622598, -117.128791),
  GeoCoord(32.622622, -117.133183),
  GeoCoord(32.618690, -117.133634),
  GeoCoord(32.618980, -117.128403),
  GeoCoord(32.609847, -117.132502),
  GeoCoord(32.604198, -117.125333),
  GeoCoord(32.588260, -117.122032),
  GeoCoord(32.591164, -117.116851),
  GeoCoord(32.587601, -117.105968),
  GeoCoord(32.583792, -117.104434),
  GeoCoord(32.570566, -117.101382),
  GeoCoord(32.569256, -117.122378),
  GeoCoord(32.560825, -117.122903),
  GeoCoord(32.557753, -117.131040),
  GeoCoord(32.542737, -117.124883),
  GeoCoord(32.534156, -117.126062),
  GeoCoord(32.563255, -117.134963),
  GeoCoord(32.584055, -117.134263),
  GeoCoord(32.619405, -117.140001),
  GeoCoord(32.655293, -117.157349),
  GeoCoord(32.669944, -117.169624),
  GeoCoord(32.682710, -117.189445),
  GeoCoord(32.685297, -117.208773),
  GeoCoord(32.679814, -117.224882),
  GeoCoord(32.697212, -117.227058),
  GeoCoord(32.707701, -117.219816),
  GeoCoord(32.711931, -117.214107),
  GeoCoord(32.715026, -117.196521),
  GeoCoord(32.713053, -117.189703),
  GeoCoord(32.707868, -117.191018),
];
