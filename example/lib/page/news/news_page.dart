import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}
class _NewsPageState extends State<NewsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 40,
        backgroundColor: Colors.purple,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text('ข่าวสาร กิจกรรม')),
            body: Container(
              child: WebView(
        initialUrl: 'https://bsru.ac.th/news/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
            ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'web_view_container.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Homenews extends StatelessWidget {
//   final _links = ['https://google.com'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//                 child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: _links.map((link) => _urlButton(context, link)).toList(),
//     ))));
//   }

//   Widget _urlButton(BuildContext context, String url) {
//     return Container(
//         padding: EdgeInsets.all(20.0),
//         child: FlatButton(
//           color: Theme.of(context).primaryColor,
//           padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
//           child: Text(url),
//           onPressed: () => _handleURLButtonPress(context, url),
//         ));
//   }

//   void _handleURLButtonPress(BuildContext context, String url) {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => WebViewContainer(url)));
//   }
// }

// // import 'package:flutter/material.dart';

