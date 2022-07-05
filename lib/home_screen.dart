import 'package:flutter/material.dart';
import 'package:franc_third_party_integration_demo/web_view_app_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hello"),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(16.0),
                  primary: Colors.orange,
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WebViewApp()),
                  );
                },
                child: Text('PRESS ME'),
              ),
            ]),
      ),
    );
  }
}
