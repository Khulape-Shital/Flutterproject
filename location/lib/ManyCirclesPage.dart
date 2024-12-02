// flutter_map_example/pages/many_circles.dart
import 'package:flutter/material.dart';

class ManyCirclesPage extends StatelessWidget {
  static const String route = '/many_circles';

  const ManyCirclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Many Circles')),
      body: const Center(child: Text('Many Circles Page Content')),
    );
  }
}
