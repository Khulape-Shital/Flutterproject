// flutter_map_example/pages/animated_map_controller.dart
import 'package:flutter/material.dart';

class AnimatedMapControllerPage extends StatelessWidget {
  static const String route = '/animated_map_controller';

  const AnimatedMapControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Map Controller')),
      body: const Center(child: Text('Animated Map Controller Page Content')),
    );
  }
}
