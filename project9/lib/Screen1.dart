import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(itemCount: 5,
        itemBuilder:(context, index) {
          return Container(
            height: 200,
            width: 200,
            color: Colors.amber,
            margin: EdgeInsets.all(20),
          );
        },
        ),
      );
  }
}