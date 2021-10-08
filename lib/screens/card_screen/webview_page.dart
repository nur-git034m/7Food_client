import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
   @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebView(
           initialUrl: 'https://api.tarlanpayments.kz/payservice?payment_id=57585405&payment_hash=5f93dfbeee24cdb22ce46bae6dce3984',
            javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}