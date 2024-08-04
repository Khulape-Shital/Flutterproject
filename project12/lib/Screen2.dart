import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final String data;
  const Screen2({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(data),),
    );
  }
}