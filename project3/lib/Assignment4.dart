import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Assignment4 extends StatelessWidget {
  const Assignment4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Colomn"),
        backgroundColor: const Color.fromARGB(255, 184, 96, 125),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.amber,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1000)),
                        color: Colors.black),
                  ),
                  Text("Hello Coders"),
                ],
              ),
              Container(
                height: 100,
              ),
              Row(
                children: [
                  Icon(Icons.headphones_battery),
                  Text("data"),
                  Icon(Icons.heart_broken)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
