// flutter_map_example/pages/polyline_perf_stress.dart
import 'package:flutter/material.dart';

class PolylinePerfStressPage extends StatelessWidget {
  static const String route = '/polyline_perf_stress';

  const PolylinePerfStressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polyline Performance Stress Test')),
      body: const Center(child: Text('Polyline Performance Stress Page Content')),
    );
  }
}
