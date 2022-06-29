import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebWievTest extends StatefulWidget {
  const WebWievTest({Key? key}) : super(key: key);

  @override
  State<WebWievTest> createState() => _WebWievTestState();
}

class _WebWievTestState extends State<WebWievTest> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              "Test Web View in Flutter Package :webview_flutter --Crash"),
        ),
        body: const WebView(
          initialUrl: 'https://flutter.dev',
        ));
  }
}
