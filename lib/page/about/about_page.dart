import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  WebViewController _controller;
  String _title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('$_title', style: TextStyle(
      //     color: Colors.black
      //   ),),
      //   backgroundColor: Colors.white,
      // ),
      body: Builder(builder: (ctx){
        return Container(
          child: SafeArea(
            child: WebView(
              initialUrl: "https://www.baidu.com",
              //JS执行模式 是否允许JS执行
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              onPageFinished: (url) {
                  _controller.evaluateJavascript("document.title").then((result){
                    setState(() {
                      _title = result;
                    });
                  }
                );
              },
            )
          ),
        );
      }),
    );
  }
}