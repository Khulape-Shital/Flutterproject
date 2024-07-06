import 'package:flutter/material.dart';

class Assignment7 extends StatelessWidget {
  const Assignment7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Application"),
          backgroundColor: Color.fromARGB(255, 89, 89, 190),
        ),
        body: Center(
          child: Row(children: [
            Container(
              height: 100,
              width: 100,
              color: Color.fromARGB(255, 136, 136, 192),
            ),
            Container(
                height: 200,
                width: 200,
                color: Color.fromARGB(255, 10, 10, 103))
          ]),
        ));
  }
}
