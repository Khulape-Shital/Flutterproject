// flutter_map_example/pages/retina.dart
import 'package:flutter/material.dart';

class RetinaPage extends StatelessWidget {
  static const String route = '/retina';

  const RetinaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Retina Page')),
      body: const Center(child: Text('Retina Page Content')),
    );
  }
}
