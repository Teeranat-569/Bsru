import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {  
  @override
  _NewsPageState createState() => _NewsPageState();
}     
class _NewsPageState extends State<NewsPage> {
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
        initialUrl: 'https://www.bsru.ac.th/news/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
            ),
      ),
    );
  }
}
