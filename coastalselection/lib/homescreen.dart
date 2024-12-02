import 'package:coastalselection/BeachSelectionScreen.dart';
import 'package:coastalselection/class.dart';
import 'package:flutter/material.dart';

// Example data


class HomeScreen extends StatelessWidget {
  final List? beach;
  const HomeScreen({super.key,required this.beach})
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to BeachSelectionScreen with data
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>BeachSelectionScreen(stateBeachesData: beach),
              ),
            );
          },
          child: Text('Select a Beach'),
        ),
      ),
    );
  }
}
