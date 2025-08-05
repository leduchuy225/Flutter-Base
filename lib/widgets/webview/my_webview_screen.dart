import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/utils/utils.dart';

class MyWebviewScreen extends StatefulWidget {
  final String url;
  final String title;

  const MyWebviewScreen({super.key, required this.url, required this.title});

  @override
  State<MyWebviewScreen> createState() => _MyWebviewScreenState();
}

class _MyWebviewScreenState extends State<MyWebviewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            print(request.url);
            if (request.url.startsWith('intent://www.google.com/maps')) {
              launchMyURL(request.url, mode: LaunchMode.externalApplication);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final canNavigate = await _controller.canGoBack();
        if (canNavigate) {
          _controller.goBack();
          return;
        }
        Get.back();
      },
      child: Scaffold(
        appBar: MyAppbar.appBar(widget.title),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
