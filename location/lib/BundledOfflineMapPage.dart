// flutter_map_example/pages/bundled_offline_map.dart
import 'package:flutter/material.dart';

class BundledOfflineMapPage extends StatelessWidget {
  static const String route = '/bundled_offline_map';

  const BundledOfflineMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bundled Offline Map')),
      body: const Center(child: Text('Bundled Offline Map Page Content')),
    );
  }
}
