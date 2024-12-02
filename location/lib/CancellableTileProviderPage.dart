// Example for PolylinePage

import 'package:flutter/material.dart';

class Cancellabletileproviderpage extends StatelessWidget {
  static const String route = '/polyline';

  const Cancellabletileproviderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polyline Page')),
      body: Center(child: const Text('Polyline Page Content')),
    );
  }
}
