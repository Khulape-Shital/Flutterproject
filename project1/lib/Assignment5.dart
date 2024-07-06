import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Application"),
          backgroundColor: Color.fromARGB(255, 89, 89, 190),
        ),
        body: Center(
            child: Container(
                height: 100,
                width: 100,
                color: Color.fromARGB(249, 24, 24, 160),
                child: Center(
                  child: Text("Demo"),
                ))));
  }
}
