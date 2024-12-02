// flutter_map_example/pages/circle.dart
import 'package:flutter/material.dart';

class CirclePage extends StatelessWidget {
  static const String route = '/circle';

  const CirclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circle Page')),
      body: const Center(child: Text('Circle Page Content')),
    );
  }
}
