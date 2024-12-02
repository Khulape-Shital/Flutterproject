// flutter_map_example/pages/map_controller.dart
import 'package:flutter/material.dart';

class MapControllerPage extends StatelessWidget {
  static const String route = '/map_controller';

  const MapControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Controller')),
      body: const Center(child: Text('Map Controller Page Content')),
    );
  }
}
