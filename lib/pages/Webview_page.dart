import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:news/style/styleImport.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key, this.title, this.url}) : super(key: key);
  final String title;
  final String url;
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  Widget build(BuildContext context) {
    return
          WebviewScaffold(
            url: widget.url,
            withZoom: true,
           appBar: AppBar(title: Text(widget.title,)),
           hidden: true,
           initialChild: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top:20)),
                  Text(Constant.textLoadNews),
                ],
              ),
            ),
          ),
          );
  }
}