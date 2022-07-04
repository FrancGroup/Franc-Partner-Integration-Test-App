import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  bool isLoading = true;
  bool _dstReached = false;
  late WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    _dstReached ? Navigator.pop(context) : print('');
    return Stack(children: <Widget>[
      AppBar(
        title: const Text('PayMeNow Demo App'),
      ),
      WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
          });
        },
        initialUrl: 'https://155d4d8a.franc-partner-integration.pages.dev/',
        onWebViewCreated: (webViewController) =>
            _webViewController = webViewController,
        navigationDelegate: (NavigationRequest request) {
          if (request.url == '') {
            //configure to home page when want to exit webview and set intial URL to registration or deposit page
            setState(() {
              _dstReached = true;
            });
            Navigator.pop(context);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Stack(),
    ]);
  }
}
