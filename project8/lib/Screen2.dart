import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
        title: Text("Colomn"),
        backgroundColor: const Color.fromARGB(255, 184, 96, 125),
        centerTitle: true,
      ),
      
    );
  }
}