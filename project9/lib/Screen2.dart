import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
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