// flutter_map_example/pages/secondary_tap.dart
import 'package:flutter/material.dart';

class SecondaryTapPage extends StatelessWidget {
  static const String route = '/secondary_tap';

  const SecondaryTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secondary Tap Page')),
      body: const Center(child: Text('Secondary Tap Page Content')),
    );
  }
}
