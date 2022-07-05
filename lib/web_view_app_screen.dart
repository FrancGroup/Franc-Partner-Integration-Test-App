import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:franc_third_party_integration_demo/home_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  var url = "https://155d4d8a.franc-partner-integration.pages.dev/register";
  final Completer<WebViewController> _webviewController =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webviewController) {
          _webviewController.complete(webviewController);
        },
        onPageFinished: (String url) {
          setState(
            () {
              this.url = url.toString();
            },
          );

          if (url == "https://155d4d8a.franc-partner-integration.pages.dev/") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
      )
    ]);
  }
}
