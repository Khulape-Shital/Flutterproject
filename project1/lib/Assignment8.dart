import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Assignment8 extends StatelessWidget {
  const Assignment8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          backgroundColor: Color.fromARGB(250, 76, 76, 186),
        ),
        body: Container(
          height: 100,
          width: 100,
          color: Color.fromARGB(255, 37, 169, 206),
          child: Center(child: Text("Demo")),
        ));
  }
}
