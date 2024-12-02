import 'package:coastalselection/screens/BeachSelectionScreen.dart';

import 'package:coastalselection/screens/data.dart';
import 'package:flutter/material.dart';


class Searchplace extends StatelessWidget {
  List beachesinfo;
   Searchplace({super.key, required this.beachesinfo});
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
                builder: (context) => BeachSelectionScreen(stateBeachesData: beaches),
              ),
            );
          },
          child: Text('Select a Beach'),
        ),
      ),
    );
  }
}
