// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatefulWidget {
//   final String url;

//   WebViewScreen({required this.url});

//   @override
//   _WebViewScreenState createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Initialize WebView
//     WebViewPlatform.instance.clearCookies(); // Clear cookies if needed
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hotel Website"),
//       ),
//       body: WebView(
//         initialUrl: widget.url, // The URL passed from the previous screen
//         javascriptMode: JavascriptMode.unrestricted, // Enable JS support
//       ),
//     );
//   }
// }
